//
//  SettingsViewModel.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 13/04/2026.
//

import Foundation

class SettingsViewModel {
    private let localService = LocalService()
    
    func getUser() -> User? {
        return localService.getUser()
    }
    
    func deleteUser() {
        localService.deleteUser()
    }
}
