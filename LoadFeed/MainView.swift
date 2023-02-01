//
//  MainView.swift
//  SwiftUITutorial
//
//  Created by Henry Bridge on 12/15/22.
//

import SwiftUI

struct MainView: View {
    @State private var projects = [SolarProject]()
    @State private var plants = [EGridPlant]()
    let location = LocationHelper.currentLocation
    func loadSolarProjects() async {
        guard let url = URL(string:"https://data.ny.gov/resource/3x8r-34rs.json?$where=within_circle(georeference,\(location.latitude),\(location.longitude),1000)")
        else {
            print("Invalid Solar Project Fetch URL")
            return
        }
        print("Fetching url: \(url)")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            projects = try decoder.decode([SolarProject].self, from: data)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func loadPowerPlants() async {
        guard let url = URL(string:"https://egrid-server.fly.dev/api/plants/?lat=\(location.latitude)&lng=\(location.longitude)&rad=10")
        else {
            print("Invalid Power Plant Fetch URL")
            return
        }
        print("Fetching url: \(url)")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let plant_response = try decoder.decode(EGridPlantResults.self, from: data)
            plants = plant_response.results
        } catch {
            print("Error: \(error)")
        }
    }
    
    var body: some View {
        TabView {
            ContentView(projects: projects, plants: plants)
                .tabItem{
                    Label("List", systemImage: "list.dash")
                }
            MapView(projects: projects, plants: plants, location: location)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
        }
        .task {
            await loadSolarProjects()
            await loadPowerPlants()
        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
