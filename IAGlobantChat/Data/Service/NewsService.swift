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
    private let apiKey = "4c7020134fc442f89e7bd4073e66453a"

    func getNews(page: Int) async throws -> [Article] {

        let urlString = "https://newsapi.org/v2/top-headlines?country=us&pageSize=10&page=\(page)&apiKey=\(apiKey)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await session.data(from: url)


        let decoded = try JSONDecoder().decode(ResponseApi.self, from: data)
        return decoded.articles ?? []
    }

    func search(query: String) async throws -> [Article] {

        let urlString = "https://newsapi.org/v2/everything?q=\(query)&apiKey=\(apiKey)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await session.data(from: url)


        let decoded = try JSONDecoder().decode(ResponseApi.self, from: data)
        return decoded.articles ?? []
    }
}
