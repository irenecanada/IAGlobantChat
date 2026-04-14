//
//  Chat.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 24/3/26.
//

import SwiftUI

struct ChatNoMessagesView: View {
    
    @State private var show = false
    @State private var Started = false
    
    
    var body: some View {
        Group {
            if Started{
                ChatScreen()
            } else {
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
                            Started.toggle()
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
                    }
                }
            }
        }
    }


#Preview {
    ChatNoMessagesView()
}
