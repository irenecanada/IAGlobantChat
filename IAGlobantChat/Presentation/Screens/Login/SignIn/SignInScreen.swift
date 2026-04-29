//
//  SignIn.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 23/3/26.
//
import SwiftUI

struct SignInScreen: View {
    @Environment(LocalService.self) var localService
    @State var viewModel: SignInViewModel

    var body: some View {
        @Bindable var viewModel = viewModel
        NavigationStack {
            VStack(spacing: 50) {
                HeaderView(titulo: "Welcome Back",
                           descripcion: "Sign in to continue messaging")

                VStack(alignment: .leading, spacing: 15) {

                    FormTextField(title: "Email",
                                  placeholder: "you@example.com",
                                  value: $viewModel.email)
                    FormTextField(title: "Password",
                                  placeholder: "At least 6 characters",
                                  isSecure: true,
                                  value: $viewModel.password)

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

            FooterView(
                title: "Don't have an account?",
                content: AnyView(
                    NavigationLink("Sign up") { SignUpScreen() }
                )
            )
        }
    }
}


