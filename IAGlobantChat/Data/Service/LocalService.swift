//
//  LocalService.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 13/04/2026.
//

import Foundation

@MainActor
@Observable class LocalService {
    
    private let userDefaults: UserDefaults
    var currentUser: User?
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func storeUser(user: User) {
        if let data = try? JSONEncoder().encode(user){
            userDefaults.set(data, forKey: "userName")
        }
    }

    func login(user: User) {
        currentUser = user
    }
    
    func getUser() -> User? {
        if let data = userDefaults.data(forKey: "userName"){
            let user = try? JSONDecoder().decode(User.self, from: data)
            return user
        }
        return nil
    }
    
    func deleteUser() {
        userDefaults.removeObject(forKey: "userName")
        currentUser = nil
    }
    
    func restoreUser() {
        currentUser = getUser()
    }
}
