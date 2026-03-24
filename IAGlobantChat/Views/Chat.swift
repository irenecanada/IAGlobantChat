//
//  Chat.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 24/3/26.
//

import SwiftUI

struct Chat: View {
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
                
            }){
                Text("Create First Chat")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    .padding(.top, 20)
                    
            }.padding(.horizontal, 115)
        }
    }
}

#Preview {
    Chat()
}
