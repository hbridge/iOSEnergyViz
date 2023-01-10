//
//  ContentView.swift
//  LoadFeed
//
//  Created by Henry Bridge on 12/16/22.
//

import SwiftUI

struct ContentView: View {
    let projects: [SolarProject]
    
    var body: some View {
        NavigationStack {
            List(projects, id: \.project_number) { item in
                NavigationLink(value: item) {
                    VStack(alignment: .leading) {
                        Text(item.street_address ?? item.project_number)
                        Text(item.latitude + ", " + item.longitude)
                    }
                }
            }
            .navigationDestination(for: SolarProject.self) { item in
                SolarDetail(project: item)
            }
            .navigationTitle("Projects")
            .listStyle(GroupedListStyle())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(projects: [SolarProject.example])
    }
}
