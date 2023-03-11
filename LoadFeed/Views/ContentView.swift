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
            .navigationDestination(for: EGridPlant.self) { item in
                PlantDetail(plant: item)
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
                Text(plant.name).bold()
                HStack(alignment: .center, spacing: 4.0) {
                    Image(systemName: plant.iconStyle()["icon"]!)
                        .foregroundColor(Color(plant.iconStyle()["colorString"]!))
                    Text("\(plant.fuelTypeDisplay()) Plant")
                }
            }
        }
    }
}

struct SolarProjectNavLink: View {
    let project: SolarProject
    var body: some View {
        NavigationLink(value: project) {
            VStack(alignment: .leading) {
                Text(project.name)
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
