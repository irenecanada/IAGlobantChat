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
                ChatEmptyView()
            }.tabItem {
                Label("Home", systemImage: "house")
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
