//
//  Untitled.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 9/4/26.
//
import Foundation
import SwiftUI

struct ChatView: View {
    let name: String
    let message: String
    let time: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray.opacity(0.3))
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(name).font(.headline)
                    Spacer()
                    Text(time).font(.subheadline).foregroundColor(.secondary)
                }
                Text(message).font(.subheadline).foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
