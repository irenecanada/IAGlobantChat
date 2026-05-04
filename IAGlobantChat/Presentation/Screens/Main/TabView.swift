//
//  TabViewMain.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 24/3/26.
//

import SwiftUI

struct TabMainView: View {
    var body: some View {
        TabView{
            NavigationStack {
                ChatScreen()
            }.tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationStack {
                NewsScreen()
            }.tabItem {
                Label("News", systemImage: "newspaper")
            }

            NavigationStack {
                SettingsScreen()
            }.tabItem {
                Label("Settings", systemImage: "gearshape")
            }

            
        }
    }
}

#Preview {
    TabMainView()
}
