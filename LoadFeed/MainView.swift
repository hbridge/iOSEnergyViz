//
//  MainView.swift
//  SwiftUITutorial
//
//  Created by Henry Bridge on 12/15/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem{
                    Label("List", systemImage: "list.dash")
                }
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
