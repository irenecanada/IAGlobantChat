//
//  SettingsScreen.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 9/4/26.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(LocalService.self) var localService
    @Environment(ChatService.self) var chatService
    @State var show = false
    //@State var viewModel = SettingsViewModel()

    var body: some View {
        VStack{
            List{
                SettingsSection(secctionTitle: "ACCOUNT",
                                image: "person.circle.fill",
                                user: localService.currentUser,
                                color: .secondary,
                                colorBack: .gray)
                
                SettingsSection(secctionTitle: "MESSAGES",
                                image: "text.bubble",
                                title: "Total Chats",
                                descripcion: "\(chatService.chats.count) conversations",
                                color: .white,
                                colorBack: .blue)
                
                Section(header: Text("DANGER ZONE")) {
                    Button(action: {
                        show = true
                    }) {
                        SettingsSection(
                            secctionTitle: "",
                            image: "trash",
                            title: "Delete all chats",
                            descripcion: "This action cannot be undone",
                            color: .white,
                            colorBack: .red
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .alert("Delete all chats", isPresented: $show) {
                        Button("Delete all") {
                            chatService.deleteChats()
                        }
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("This will permanently delete all your chats. This action cannot be undone.")
                    }
                }
                
                
                Section{
                    Button(action: {
                        logout()
                    }) {
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.right.to.line")
                            Text("Sign Out")
                            Spacer()
                        }
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 1)
                        )
                        
                    }
                }
                Section {
                    VStack(alignment: .center, spacing: 4) {
                        Text("iMessage Clone")
                        Text("Version 1.0.0")
                    }
                    .frame(maxWidth: .infinity)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .listRowBackground(Color.clear)
                }
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Settings")
        .onAppear {
            chatService.restoreChats()
            print(chatService.chats.count)
        }
    }

    func logout() {
        localService.deleteUser()
        chatService.deleteChats()
    }

}




//#Preview {
//  SettingsScreen()
//}



