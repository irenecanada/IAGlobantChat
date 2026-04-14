//
//  SettingsScreen.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 9/4/26.
//

import SwiftUI

struct SettingsScreen: View {
    @State var viewModel = SettingsViewModel()
    @Environment(LocalService.self) var localService
    @State var show = false

    var body: some View {
        VStack{
            List{
                Section(header: Text("ACCOUNT")) {
                    HStack(spacing: 15) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray.opacity(0.3))
                        if let user = viewModel.getUser() {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.subheadline).foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                
                Section(header: Text("MESSAGES")) {
                    HStack(spacing: 15) {
                        Image(systemName: "text.bubble")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .opacity(0.7)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Total Chats: ")
                            HStack{
                                Text("User").font(.subheadline).foregroundColor(.secondary)
                                Text("conversations").font(.subheadline).foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                Section(header: Text("DANGER ZONE")) {
                    Button(action: {
                        show = true
                    }){
                        HStack(spacing: 15) {
                            Image(systemName: "trash")
                                .font(.system(size: 30))
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                                .background(Color.red.opacity(0.2))
                                .foregroundColor(.red)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Delete all chats ").font(.headline).foregroundColor(.red)
                                Text("This action cannot be undone ").font(.headline).foregroundColor(.gray)
                                
                            }
                        }
                    }.alert("Delete all chats", isPresented: $show){
                        Button("Delete all", role: .destructive){
                            
                        }
                        Button("Cancel", role: .cancel){
                            
                        }
                    }message: {
                        Text("This will permanently delete all your chats. This action cannot be undone.")
                    }
                    
                }
                .padding(.vertical, 4)
                
                Section{
                    Button(action: {
                        localService.deleteUser()
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
            .navigationTitle("Settings")
        }
    }
}



#Preview {
    SettingsScreen()
}
