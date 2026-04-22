//
//  RootView.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 15/04/2026.
//

import Foundation
import SwiftUI

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
