//
//  IAGlobantChatApp.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 23/3/26.
//

import SwiftUI

@main
struct IAGlobantChatApp: App {
    @State var localService = LocalService()
    
    init() {
        localService.restoreUser()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(localService)
        }
    }
}

struct RootView: View {
    @Environment(LocalService.self) var localService
    
    var body: some View {
        if localService.currentUser != nil {
            TabMainView()
        } else {
            SignInScreen(viewModel: SignInViewModel())
        }
    }
}
