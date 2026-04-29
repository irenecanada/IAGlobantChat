//
//  ChatEmptyView.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 4/22/26.
//

import SwiftUI

struct ChatEmptyView: View {
    @Environment(ChatService.self) var chatService
    @State private var show = false
    @State var name =  ""

    var body: some View {
        VStack {
            Image(systemName: "ellipsis.message")
                .resizable()
                .frame(width: 45, height: 45)

            Text("No messages")
                .font(Font.title)
                .padding(2)

            Text("Start a converdation with someone")
                .font(Font.subheadline)
                .foregroundStyle(Color(.secondaryLabel))

            Button(action: {
                show.toggle()
            }){
                Text("Create First Chat")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color.black, lineWidth: 2))

            }.padding(.horizontal, 115)
                .padding(.top, 20)
                .alert("New Chats", isPresented: $show){
                    TextField("Enter chat name...", text: $name)

                    HStack{
                        Button("Create"){
                            chatService.addChats(chatName: name)
                            name = ""
                        }
                        Button("Cancel", role: .cancel){

                        }
                    }
                } message: {
                    Text("Chat Name")
                }
        }

    }
}


