//
//  MainView.swift
//  SwiftUITutorial
//
//  Created by Henry Bridge on 12/15/22.
//

import SwiftUI

struct MainView: View {
    @State private var projects = [SolarProject]()
    func loadData() async {
        guard let url = URL(string:"https://data.ny.gov/resource/3x8r-34rs.json?$where=within_circle(georeference,40.681165,-73.995742,1000)")
        else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            projects = try decoder.decode([SolarProject].self, from: data)
        } catch {
            print("Error: \(error)")
        }
    }
    
    var body: some View {
        TabView {
            ContentView(projects: projects)
                .tabItem{
                    Label("List", systemImage: "list.dash")
                }
            MapView(projects: projects)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
        }
        .task {
            await loadData()
        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
