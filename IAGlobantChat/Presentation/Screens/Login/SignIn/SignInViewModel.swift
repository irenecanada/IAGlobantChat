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
    var isCreated = false
    
    @MainActor
    func login(localService: LocalService) {
        errorMessage = nil
        isLoading = true

        if email.isEmpty || password.isEmpty {
            errorMessage = "Please fill in all fields"
            isLoading = false
            return
        }


        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                self.isLoading = false

                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }

                if let user = authResult?.user {
                    let newUser = User(name: self.name, email: user.email ?? self.email, password: self.password)
                    localService.storeUser(user: newUser)
                    localService.login(user: newUser)
                    self.isLogged = true
                }

        }
    }


    @MainActor
    func googleSignIn(localService: LocalService) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let rootViewController = windowScene.windows.first?.rootViewController else { return }

        isLoading = true

        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] user, error in


            guard let user = user?.user,
            let idToken = user.idToken?.tokenString else {
                self.isLoading = false
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)


            Auth.auth().signIn(with: credential) { authResult, error in
                self.isLoading = false

                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }

                let googleUser = User(
                    name: authResult?.user.displayName ?? "GoogleUser",
                    email: authResult?.user.email ?? "",
                    password: ""
                )

                localService.login(user: googleUser)
                self.isLogged = true
            }
        }
    }



}
