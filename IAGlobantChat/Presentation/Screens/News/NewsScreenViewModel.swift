//
//  NewsViewModel.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/23/26.
//

import Foundation
import Combine

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articulos: [Article] = []
    @Published var isLoading = false
    private let service = NewsService()
    private var currentPage = 1
    @Published var searchText = "" {
        didSet {
            Task { await search(query: searchText) }
        }
    }

    func fetch() async {

        guard !isLoading else { return }
        isLoading = true

        do {
            let nuevos = try await service.getNews(page: currentPage)

            self.articulos += nuevos
            currentPage += 1

        } catch {
            print("Error: \(error)")
        }
        isLoading = false
    }


    func nextPage(item: Article) {
        if articulos.last?.id == item.id {
            Task { await fetch() }
        }
    }


    func search(query: String) async {

        try? await Task.sleep(for: .seconds(1))
        guard query == searchText else { return }

        isLoading = true
        if let resultados = try? await service.search(query: query) {
            self.articulos = resultados
            self.currentPage = 1
        }
        isLoading = false
    }
}
