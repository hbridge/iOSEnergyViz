//
//  DetailView.swift
//  LoadFeed
//
//  Created by Henry Bridge on 1/6/23.
//

import SwiftUI

struct SolarDetail: View {
    let project: SolarProject
    @State private var showJSON = false
    var body: some View {
        Form {
            Section("Location & Type") {
                HStack {
                    Text("City").bold()
                    Spacer()
                    Text(project.city + ", " + project.state)
                }
                HStack {
                    Text("Sector").bold()
                    Spacer()
                    Text(project.sector)
                }
                HStack {
                    Text("Status").bold()
                    Spacer()
                    Text(project.project_status)
                }
            }
            Section("Equipment") {
                HStack {
                    Text("Inverter").bold()
                    Spacer()
                    Text("\(project.inverter_manufacturer ?? "Unknown") \(project.primary_inverter_model_number ?? "")")
                }
                HStack {
                    Text("Number of Panels").bold()
                    Spacer()
                    Text("\(project.pv_module_quantity ?? "Unknown")")
                }
                HStack {
                    Text("Panel Type").bold()
                    Spacer()
                    Text("\(project.pv_module_model_number ?? "Unknown")")
                }
                HStack {
                    Text("System KW Max").bold()
                    Spacer()
                    Text("\(project.totalnameplatekwdc ?? "Unknown")")
                }
                HStack {
                    Text("Expected Annual KWh").bold()
                    Spacer()
                    Text("\(project.expected_kwh_annual_production ?? "Unknown")")
                }
            }
            Section("Data") {
                HStack {
                    Text("Source").bold()
                    Spacer()
                    Text("NYSERDA")
                }
                VStack { Toggle("Show Raw", isOn: $showJSON)
                    if showJSON {
                        var raw = String(reflecting: project).split(separator:", ").joined(separator: ",\n ")
                        Text(raw).font(.caption).monospaced()
                    }
                }
            }
        }
        
        .navigationTitle(project.street_address ?? project.project_number)
        .navigationBarTitleDisplayMode(.inline)
    }
        
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SolarDetail(project: SolarProject.example)
        }
    }
}
