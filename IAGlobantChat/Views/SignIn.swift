//
//  SignIn.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 23/3/26.
//

import SwiftUI

struct SignIn: View {
    
    @State private var estaActivo = false
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 50) {
                Header(titulo: "Welcome Back", descripcion: "Sign in to continue messaging")
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Email")
                        .font(.subheadline)
                    
                    TextField("you@example.com", text: $viewModel.email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    Text("Password")
                        .font(.subheadline)
                    
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
                    Task { await viewModel.login() }
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
                
                
                NavigationLink(destination: TabViewMain(), isActive: $viewModel.isLogged) {
                    EmptyView()
                }
                
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            
            .padding(.horizontal, 25)
            
            HStack {
                
                
                Text("Don't have an account?")
                    .font(.subheadline)
                NavigationLink {
                    SignUp()
                } label: {
                    Text("Sign up")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                
            }.padding()
            
            Text("By Signing In, you agree to our Terms and Privacy Policy.")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
        }
    }
}


#Preview {
    SignIn()
}
