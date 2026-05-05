//
//  SignUpViewModel.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 9/4/26.
//

import Foundation
import Combine
import SwiftUI
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

@Observable class SignUpViewModel {
    var email = ""
    var password = ""
    var confirmPassword = ""
    var name = ""
    var isLoading = false
    var errorMessage: String?
    var success = false

    @MainActor
    func createAccount(localService: LocalService) {
        if name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            errorMessage = "Please fill in all fields"
            return
        }

        if password != confirmPassword {
            errorMessage = "Passwords don't match"
            return
        }

        if password.count < 6 {
            errorMessage = "Password must be at least 6 characters"
            return
        }

            isLoading = true
            errorMessage = nil

            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                self.isLoading = false

                if let error = error {
                    self.errorMessage = error.localizedDescription

                    return
                }

                let newUser = User(name: self.name, email: self.email, password: self.password)
                localService.storeUser(user: newUser)
                self.success = true
            }

        }
    }
