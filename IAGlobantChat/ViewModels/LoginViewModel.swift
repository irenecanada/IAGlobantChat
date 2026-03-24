//
//  File.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 24/3/26.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var password2 = ""
    @Published var name = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isLogged = false
    @Published var isCreated = false
    @Published var emailCreate = ""
    @Published var passwordCreate = ""

    
    @MainActor
    func login() async {
        errorMessage = nil
        isLoading = true
        

        if email.isEmpty || password.isEmpty {
            errorMessage = "Please fill in all fields"
            isLoading = false
            return
        }

        if email == emailCreate && password == passwordCreate{
            isLogged = true
        } else {
            errorMessage = "El email o la contraseña no coinciden con la cuenta creada."
            isLogged = false
        }

        
        isLoading = false
    }
    

    func createAccount() {
        if name.isEmpty && email.isEmpty && password.isEmpty && password2.isEmpty{
           isCreated = false
            errorMessage = "Please fill in all fields"
        } else if password != password2{
            errorMessage = "Passwords don't match"
            isCreated = false
        } else if password.count < 6{
            errorMessage = "Password must be at least 6 characters"
            isCreated = false
        } else{
            emailCreate = email
            passwordCreate = password
            isCreated = true
        }
        
    }
}

