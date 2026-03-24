//
//  Header.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 23/3/26.
//

import SwiftUI

struct Header: View {
    @State public var titulo : String
    @State public var descripcion : String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 90, height: 90)
                .shadow(radius: 15)
                .cornerRadius(20)
            
            Image(systemName: "ellipsis.message.fill")
                .resizable()
                .frame(width: 45, height: 45)
                .foregroundStyle(.white)
        }
        .padding(.top, 50)
        
        
        VStack(spacing: 8) {
            Text(titulo)
                .font(.largeTitle.bold())
            
            Text(descripcion)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}


