//
//  File.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 24/3/26.
//

import Foundation
import Combine
import SwiftUI

@Observable class SignInViewModel {
    var email = ""
    var password = ""
    var password2 = ""
    var name = ""
    var isLoading = false
    var errorMessage: String?
    var isLogged = false
    var isCreated = false
    
    private let localService = LocalService()
    
    @MainActor
    func login() async {
        errorMessage = nil
        isLoading = true
        
        
        let user = localService.getUser()
        
        
        if email.isEmpty || password.isEmpty {
            errorMessage = "Please fill in all fields"
            isLoading = false
            return
        }
        
        if email == user?.email && password == user?.password {
            isLogged = true
        } else {
            errorMessage = "El email o la contraseña no coinciden con la cuenta creada."
            isLogged = false
        }
        
        
        isLoading = false
    }
    
    
    
}

