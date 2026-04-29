//
//  News.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/23/26.
//

import Foundation

struct ResponseApi: Codable {
    let articles: [Article]?
}

struct Article: Codable, Identifiable {
    var id: String { url ?? UUID().uuidString }
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
    let publishedAt: String?
}
