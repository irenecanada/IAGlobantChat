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
        VStack(spacing: 20) {
            
            Header(titulo: "Create account", descripcion: "Sign Up to start messaging")

            @Bindable var viewModel = viewModel
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
                              value: $viewModel.password2)
            }
            .padding(.horizontal, 25)

            createAccountButton

            if viewModel.isLoading {
                ProgressView()
            }
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

    var footer: some View {
        HStack {
            Text("Already have an account?").font(.subheadline)
            Button {
                dismiss()
            } label: {
                Text("Sign In")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }

        }
    }
}

#Preview {
    SignUpScreen()
}
