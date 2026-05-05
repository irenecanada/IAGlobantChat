//
//  IAGlobantChatApp.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 23/3/26.
//

import SwiftUI

@main
struct IAGlobantChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State var localService = LocalService()
    @State var chatService = ChatService()
    
    init() {
        localService.restoreUser()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(localService)
                .environment(chatService)
        }
    }
}
