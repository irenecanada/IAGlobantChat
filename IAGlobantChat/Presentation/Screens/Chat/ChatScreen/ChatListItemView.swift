//
//  Untitled.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 9/4/26.
//
import Foundation
import SwiftUI

struct ChatListItemView: View {
    let chat: Chat

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray.opacity(0.3))
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(chat.name).font(.headline)
                    Spacer()
                    Text(chat.date, style: .time)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                }
                Text(chat.messages.last?.text ?? "No messages yet")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
