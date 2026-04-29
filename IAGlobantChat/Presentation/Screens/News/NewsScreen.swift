//
//  NewsScreen.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/23/26.
//

import SwiftUI

struct NewsScreen: View {
    @StateObject var viewModel = NewsViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.articulos.isEmpty {

                    Text("No results for \"\(viewModel.searchText)\"")
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
                                viewModel.nextPage(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Noticias")
            .padding(.horizontal, 20)
            .searchable(text: $viewModel.searchText)
            .task {
                await viewModel.fetch()
            }
        }
    }
}
