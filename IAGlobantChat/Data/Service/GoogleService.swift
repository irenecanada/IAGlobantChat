//
//  GoogleService.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 5/5/26.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore


class GoogleService {

    func createUser(withEmail email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }

    func login(withEmail email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }

    func signInWithGoogle() async -> AuthDataResult? {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return nil }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let rootViewController = windowScene.windows.first?.rootViewController else { return nil }

        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)

            guard let idToken = result.user.idToken?.tokenString else { return nil }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: result.user.accessToken.tokenString)
            let authResult = try await Auth.auth().signIn(with: credential)
            return authResult

        } catch {
            return nil
        }
    }
}
