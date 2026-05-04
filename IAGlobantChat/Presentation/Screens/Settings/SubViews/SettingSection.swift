//
//  SettingSection.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 15/04/2026.
//

import Foundation
import SwiftUI

struct SettingsSection: View {
    @Environment(LocalService.self) var localService
    
    let secctionTitle : String
    let image : String
    var user: User? = nil
    var title: String? = nil
    var descripcion: String? = nil
    let color: Color
    let colorBack: Color

    var body: some View {
        Section(header: Text(secctionTitle)) {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.system(size: 30))
                    .foregroundColor(color)
                    .frame(width: 50, height: 50)
                    .background(colorBack)
                    .opacity(0.7)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                
                if let user = user {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                } else {
                    VStack (alignment: .leading, spacing: 5){
                        Text(title ?? "")
                            .font(.headline)
                        Text(descripcion ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
    
}
