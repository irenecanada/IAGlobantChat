//
//  TabViewMain.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 24/3/26.
//

import SwiftUI

struct TabViewMain: View {
    var body: some View {
        TabView{
            Chat().tabItem {
                Label("Home", systemImage: "house")
            }
            Chat().tabItem {
                Label("Settings", systemImage: "gearshape")
            }
            
        }
    }
}

#Preview {
    TabViewMain()
}
