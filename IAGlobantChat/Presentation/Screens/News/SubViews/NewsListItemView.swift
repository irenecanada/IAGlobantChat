//
//  NewsListItemView.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/23/26.
//

import SwiftUI

struct NewsListItemView: View {
    var image: String
    var title: String
    var autor: String
    var date: String

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: image)) { imag in
                imag
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .clipped()
            .cornerRadius(12)

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                HStack {
                    Image(systemName: "person.circle")
                    Text(autor)
                        .font(.caption)
                        .bold()
                    Spacer()
                    Image(systemName: "calendar")
                    Text(date.prefix(10))
                        .font(.caption2)
                }
                .foregroundColor(.secondary)
            }
            .padding()
        }
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .shadow(radius: 2)
        .padding(.horizontal, 50)
    }
}
