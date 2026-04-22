//
//  Message.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 16/04/2026.
//

import Foundation

struct Message: Codable, Identifiable {
    let id: UUID
    let text: String
    let user: Bool
}
