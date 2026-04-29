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

    var body: some View {
        @Bindable var viewModel = viewModel

        VStack(spacing: 20) {

            HeaderView(titulo: "Create account", descripcion: "Sign Up to start messaging")


            VStack(alignment: .leading, spacing: 15) {
                FormTextField(title: "Full Name",
                              placeholder: "Jhon Doe",
                              value: $viewModel.name)
                FormTextField(title: "Email",
                              placeholder: "you@example.com",
                              value: $viewModel.email)
                FormTextField(title: "Password",
                              placeholder: "At least 6 characters",
                              isSecure: true,
                              value: $viewModel.password)
                FormTextField(title: "Confirm Password",
                              placeholder: "Re-Enter your password",
                              isSecure: true,
                              value: $viewModel.confirmPassword)
            }
            .padding(.horizontal, 25)


            if viewModel.isLoading {
                ProgressView()
            }
            
            createAccountButton

            FooterView(
                title: "Already have an account?",
                content: AnyView(
                    Button("Sign in") { dismiss() }
                )
            )
        }.navigationDestination(isPresented: $viewModel.success) {
            ChatScreen()
                .navigationBarBackButtonHidden(true) 
        }
    }

    var createAccountButton: some View {
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
    }
}
