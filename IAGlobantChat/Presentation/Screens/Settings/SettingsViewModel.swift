//
//  SettingsViewModel.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 13/04/2026.
//

import Foundation

class SettingsViewModel {
    private let localService = LocalService()
    private let chatService = ChatService()
    var total : Int = 0
    
    func getUser() -> User? {
        return localService.getUser()
    }
    
    func deleteUser() {
        localService.deleteUser()
    }
    
    func getChats()  {
        total = chatService.chats.count
        print(total)
    }
    
}
