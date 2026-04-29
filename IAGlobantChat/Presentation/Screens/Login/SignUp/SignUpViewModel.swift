//
//  SignUpViewModel.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 9/4/26.
//

import Foundation
import Combine
import SwiftUI

@Observable class SignUpViewModel {
    var email = ""
    var password = ""
    var confirmPassword = ""
    var name = ""
    var isLoading = false
    var errorMessage: String?
    var success = false

    func createAccount(localService: LocalService) {
        if name.isEmpty && email.isEmpty && password.isEmpty && confirmPassword.isEmpty{
            errorMessage = "Please fill in all fields"
        } else if password != confirmPassword {
            errorMessage = "Passwords don't match"
        } else if password.count < 6 {
            errorMessage = "Password must be at least 6 characters"
        } else{
            localService.storeUser(user: User(name: name, email: email, password: password))
            success = true
        }
        
    }
}
