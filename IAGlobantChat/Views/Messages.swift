//
//  Messages.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 25/3/26.
//

import SwiftUI


struct Messages: View {
    var body: some View {
        NavigationStack {
            VStack {
                            
                List(){
                    Text("chats")
                }
                        }
            .navigationTitle("Messages")
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: Chat()) {
                        Image(systemName: "plus")
                    }
                }
                
            }
        }
    }
}
    
    #Preview {
        Messages()
    }
