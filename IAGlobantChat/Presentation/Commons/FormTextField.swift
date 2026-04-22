//
//  FormTextField.swift
//  IAGlobantChat
//
//  Created by Alejandro Simonpietri on 22/04/2026.
//

import SwiftUI

struct FormTextField: View {
    let title: String
    let placeholder: String
    var isSecure: Bool = false
    var value: Binding<String>

    var body: some View {
        Text(title)
            .font(.subheadline)
        textField
            .padding()
            .background(Color(.systemGray6).opacity(0.7))
            .cornerRadius(12)
    }

    @ViewBuilder
    var textField: some View {
        if isSecure {
            SecureField(placeholder, text: value)
                .textContentType(.oneTimeCode)
        } else {
            TextField(placeholder, text: value)
        }
    }
}
