//
//  SignUp.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 23/3/26.
//

import SwiftUI

struct SignUp: View {
    @StateObject var viewModel = LoginViewModel()
        
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Header(titulo: "Create account", descripcion: "Sign Up to start messaging")
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Full Name")
                        .font(.subheadline)
                    
                    TextField("Jhon Doe", text: $viewModel.name)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    Text("Email")
                        .font(.subheadline)
                    
                    TextField("you@example.com", text: $viewModel.email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    Text("Password")
                        .font(.subheadline)
                    
                    SecureField("At least 6 characters", text: $viewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    Text("Confirm Password")
                        .font(.subheadline)
                    
                    SecureField("Re-Enter your password", text: $viewModel.password2)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                }
                .padding(.horizontal, 25)
                
                Button(action: {viewModel.createAccount()} ) {
                    
                    Text("Create account")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    
                }
                .padding(.horizontal, 30)
                
                NavigationLink(destination: SignIn(), isActive: $viewModel.isCreated) {
                    EmptyView()
                }
                
                if viewModel.isLoading {
                    ProgressView()
                }
                
                if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                }
                
                HStack {
                    
                    
                    Text("Alredy have an account?")
                        .font(.subheadline)
                    NavigationLink {
                        SignIn()
                    } label: {
                        Text("Sign In")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                }
                
                Text("By Signing In, you agree to our Terms and Privacy Policy.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 25)
            }
        }
    }
    
}

#Preview {
    SignUp()
}
