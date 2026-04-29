//
//  ChatViewModel.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 14/04/2026.
//

import Foundation
import SwiftUI

@Observable class ChatScreenViewModel {

    var chats: [Chat] = []
    
    
    @MainActor
    func loadChats(chatService: ChatService) {
        chats = chatService.getChats()
    }
    
    
    func hasChats() -> Bool {
        if chats.isEmpty{
            return false
        } else {
            return true
        }
    }
    
}
