//
//  NewsViewModel.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/23/26.
//

import Foundation
import Combine
import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articulos: [Article] = []
    @Published var isLoading = false
    private let service = NewsService()
    private var currentPage = 1
    private var currentQuery = ""
    @Published var noResults = false

    func fetch(query: String = "") async {
        if query != currentQuery {
            currentQuery = query
            currentPage = 1
            articulos = []
            noResults = false
        }

        guard !isLoading else { return }
        isLoading = true

        do {
            let nuevos = try await service.getNews(page: currentPage, query: query)

            if nuevos.isEmpty && !query.isEmpty && currentPage == 1 {
                noResults = true
            } else {
                self.articulos += nuevos
                currentPage += 1
                noResults = false
            }
        } catch {
            print("Error: \(error)")
        }
        isLoading = false
    }
}
