//
//  NewsScreen.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/23/26.
//

import SwiftUI

struct NewsScreen: View {
    @StateObject var viewModel = NewsViewModel()
    @State var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.noResults {
                    Text("No results for \"\(searchText)\"")
                        .foregroundColor(.secondary)
                        .padding(.top, 100)
                } else {
                    VStack {
                        ForEach(viewModel.articulos) { item in
                            NewsListItemView(
                                image: item.urlToImage ?? "",
                                title: item.title ?? "Sin titulo",
                                autor: item.author ?? "Anonimo",
                                date: item.publishedAt ?? ""
                            )
                            .onAppear {
                                if item.url == viewModel.articulos.last?.url {
                                    Task { await viewModel.fetch(query: searchText) }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Noticias")
            .padding(.horizontal, 50)
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                Task { await viewModel.fetch(query: searchText) }
            }
            .task {
                await viewModel.fetch()
            }
        }
    }
}
