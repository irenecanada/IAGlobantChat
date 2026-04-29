//
//  FooterView.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/22/26.
//

import SwiftUI

struct FooterView: View {
    let title: String
    let content: AnyView

    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(title)
                    .font(.subheadline)

                content
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            .padding(.top)

            Spacer()

            Text("By Signing In, you agree to our Terms and Privacy Policy.")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
        }
    }

}
