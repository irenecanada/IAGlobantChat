//
//  Chats.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 14/04/2026.
//

import Foundation

struct Chat: Codable, Identifiable {
    let id: UUID
    let name: String
    let date: Date
    var messages: [Message]
}
