//
//  File.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 24/3/26.
//

import Foundation
import Combine
import SwiftUI
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

@Observable class SignInViewModel {
    var email = ""
    var password = ""
    var password2 = ""
    var name = ""
    var isLoading = false
    var errorMessage: String?
    var isLogged = false
    let googleService = GoogleService()

    @MainActor
    func login(localService: LocalService) {
        guard !email.isEmpty || !password.isEmpty else {
            errorMessage = "Please fill in all fields"
            isLoading = false
            return
        }

        isLoading = true
        errorMessage = nil

        Task {
            do {
                try await googleService.login(withEmail: email, password: password)

                let user = User(name: name, email: email, password: password)
                localService.storeUser(user: user)
                localService.login(user: user)
                isLogged = true

            } catch {
                errorMessage = error.localizedDescription
            }

            isLoading = false
        }
    }


    @MainActor
    func googleSignIn(localService: LocalService) {
        isLoading = true
        errorMessage = nil

        Task {
            if let authResult = await googleService.signInWithGoogle() {

                let googleUser = User(
                    name: authResult.user.displayName ?? "GoogleUser",
                    email: authResult.user.email ?? "",
                    password: "")

                localService.login(user: googleUser)
                isLogged = true

            } else {
                errorMessage = "No se pudo iniciar sesión con Google"
            }

            isLoading = false
        }
    }
}
