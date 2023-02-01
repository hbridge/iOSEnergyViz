//
//  ContentView.swift
//  LoadFeed
//
//  Created by Henry Bridge on 12/16/22.
//

import SwiftUI

struct ContentView: View {
    let projects: [SolarProject]
    let plants: [EGridPlant]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Power Plants") {
                    ForEach(plants) { plant in
                        EGridPlantNavLink(plant: plant)
                    }
                }
                Section("Solar Projects") {
                    ForEach(projects) { project in
                        SolarProjectNavLink(project: project)
                    }
                }
            }
            .navigationDestination(for: SolarProject.self) { item in
                SolarDetail(project: item)
            }
            .navigationTitle("Energy Near You")
            .listStyle(GroupedListStyle())
        }
    }
}

struct EGridPlantNavLink: View {
    let plant: EGridPlant
    var body: some View {
        NavigationLink(value: plant) {
            VStack(alignment: .leading) {
                Text(plant.pname ?? "Unknown")
                Text("Fuel: \(plant.plprmfl ?? "Unknown")")
            }
        }
    }
}

struct SolarProjectNavLink: View {
    let project: SolarProject
    var body: some View {
        NavigationLink(value: project) {
            VStack(alignment: .leading) {
                Text(project.street_address ?? project.project_number)
                Text(project.latitude + ", " + project.longitude)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(projects: [SolarProject.example], plants: [EGridPlant.example])
    }
}
