//
//  Messages.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 25/3/26.
//

import SwiftUI

struct ChatScreen: View {
    @State private var appeared: Bool = false
    @State private var chatName: String = ""
    
    var body: some View {

        ZStack {
                VStack {
                    
                    List {
                        ChatView(name: "Sra", message: "hola que tal", time: "22:22")
                        ChatView(name: "Hey", message: "vhat2", time: "10:09 AM")
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("Messages")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { appeared = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }

            if appeared {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { appeared = false }
                    }

                VStack(spacing: 0) {
                    HStack {
                        Text("New Chat")
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {
                            withAnimation { appeared = false }
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()

                    Divider()

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Chat Name")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        TextField("Enter chat name...", text: $chatName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                    }
                    .padding()

                    HStack(spacing: 12) {
                        Button("Cancel") {
                            withAnimation { appeared = false }
                        }
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color(.systemGray6))
                        .cornerRadius(16)

                        Button("Create") {
                            withAnimation { appeared = false }
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.gray)
                        .cornerRadius(16)
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .padding(.horizontal, 25)
                .zIndex(1) 
            }
        }
    }



#Preview {
    ChatScreen()
}
