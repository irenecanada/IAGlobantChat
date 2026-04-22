//
//  SignUp.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 23/3/26.
//
import SwiftUI

struct SignUpScreen: View {
    @Environment(LocalService.self) var localService
    @Environment(\.dismiss) private var dismiss
    @State var viewModel = SignUpViewModel()
    @Binding var isActive: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            
            Header(titulo: "Create account", descripcion: "Sign Up to start messaging")
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Full Name").font(.subheadline)
                TextField("Jhon Doe", text: $viewModel.name)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                
                Text("Email").font(.subheadline)
                TextField("you@example.com", text: $viewModel.email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                
                Text("Password").font(.subheadline)
                SecureField("At least 6 characters", text: $viewModel.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                
                Text("Confirm Password").font(.subheadline)
                SecureField("Re-Enter your password", text: $viewModel.password2)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 25)
            
            Button(action: { viewModel.createAccount(localService: localService) }) {
                Text("Create account")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
            }
            .padding(.horizontal, 30)
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            HStack {
                Text("Already have an account?").font(.subheadline)
                Button {
                    isActive = false
                } label: {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                
            }
      
        }
        .onChange(of: viewModel.isCreated) { newValue in
            if newValue {
                isActive = false
            }
        }
    }
}

#Preview {
    SignUpScreen( isActive: .constant(true))
}
