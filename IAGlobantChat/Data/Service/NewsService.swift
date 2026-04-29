//
//  NewsService.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/23/26.
//

import Foundation

@MainActor
@Observable class NewsService {
    private let session = URLSession.shared
    private let apiKey = "008a4d3041034738ac8d6e73070e9ac5"

    func getNews(page: Int, query: String) async throws -> [Article] {
        let text = query.isEmpty ? "news" : query

        let urlString = "https://newsapi.org/v2/everything?q=\(text)&pageSize=10&page=\(page)&apiKey=\(apiKey)"

        guard let url = URL(string: urlString) else {
                    throw URLError(.badURL)
                }

        let (data, _) = try await session.data(from: url)


        let decoded = try JSONDecoder().decode(ResponseApi.self, from: data)
        return decoded.articles ?? []
    }
}
