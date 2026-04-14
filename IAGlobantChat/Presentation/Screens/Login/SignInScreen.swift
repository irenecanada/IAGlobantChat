//
//  SignIn.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 23/3/26.
//
import SwiftUI

struct SignInScreen: View {
    @Environment(LocalService.self) var localService
    @State private var isSignupActive = false
    @State var viewModel: SignInViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Header(titulo: "Welcome Back", descripcion: "Sign in to continue messaging")
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Email").font(.subheadline)
                    TextField("you@example.com", text: $viewModel.email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    Text("Password").font(.subheadline)
                    SecureField("Enter your password", text: $viewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 25)
                
                if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                }
                
                Button(action: {
                    Task { await viewModel.login(localService: localService) }
                }) {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .padding(.horizontal, 25)
            
            HStack {
                Text("Don't have an account?").font(.subheadline)
                
                
                NavigationLink(
                    isActive: $isSignupActive,
                    destination: {
                        SignUpScreen(isActive: $isSignupActive)
                    },
                    label: {
                        Text("Sign up")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                    })
            }
            .padding()
            
            Text("By Signing In, you agree to our Terms and Privacy Policy.")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
        }
    }
}

