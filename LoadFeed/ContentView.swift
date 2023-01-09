//
//  ContentView.swift
//  LoadFeed
//
//  Created by Henry Bridge on 12/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [SolarProject]()
    
    func loadData() async {
        guard let url = URL(string:"https://data.ny.gov/resource/3x8r-34rs.json?$where=within_circle(georeference,40.681165,-73.995742,1000)")
        else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            results = try decoder.decode([SolarProject].self, from: data)
        } catch {
            print("Error: \(error)")
        }
    }
    
    var body: some View {
        NavigationStack {
            List(results, id: \.project_number) { item in
                NavigationLink(value: item) {
                    VStack(alignment: .leading) {
                        Text(item.street_address ?? item.project_number)
                        Text(item.latitude + ", " + item.longitude)
                    }
                }
            }
            .task {
                await loadData()
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
        ContentView()
    }
}
