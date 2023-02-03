//
//  DetailView.swift
//  LoadFeed
//
//  Created by Henry Bridge on 1/6/23.
//

import SwiftUI

struct PlantDetail: View {
    let plant: EGridPlant
    @State private var showJSON = false
    var body: some View {
        Form {
            Section("General Info") {
                HStack {
                    Text("City").bold()
                    Spacer()
                    Text(plant.pstatabb ?? "")
                }
                HStack {
                    Text("Operator").bold()
                    Spacer()
                    Text(plant.oprname ?? "")
                }
                HStack {
                    Text("Utility").bold()
                    Spacer()
                    Text(plant.utlsrvnm ?? "")
                }
            }
            Section("Plant Type & Capacity") {
                HStack {
                    Text("Category").bold()
                    Spacer()
                    Text(plant.plfuelct ?? "")
                }
                HStack {
                    Text("Fuel Type").bold()
                    Spacer()
                    Text(plant.plprmfl ?? "")
                }
                HStack {
                    Text("Nameplate (Theoretical) Capacity").bold()
                    Spacer()
                    Text(String(format: "%.2f MW", plant.namepcap ?? 0.0))
                }
                HStack {
                    Text("Annual net generation").bold()
                    Spacer()
                        Text("\(plant.plngenan ?? 0) MWh")
                }
                HStack {
                    Text("Capacity factor").bold()
                    Spacer()
                    Text("\(plant.capfac ?? "Unknown")")
                }
            }
            Section("Emissions (Annual)") {
                HStack {
                    Text("CO2").bold()
                    Spacer()
                    Text("\(plant.plco2an ?? 0) tons")
                }
                HStack {
                    Text("CO2 equivalent").bold()
                    Spacer()
                    Text("\(plant.plco2eqa ?? 0) tons")
                }
                HStack {
                    Text("NOx").bold()
                    Spacer()
                    Text("\(plant.plngenoz ?? 0) tons")
                }
                HStack {
                    Text("SO2").bold()
                    Spacer()
                    Text("\(plant.plso2an ?? 0) tons")
                }
                HStack {
                    Text("CH4").bold()
                    Spacer()
                    Text("\(plant.plch4an ?? 0) lbs")
                }
                HStack {
                    Text("N2O").bold()
                    Spacer()
                    Text("\(plant.pln2oan ?? 0) lbs")
                }
                
                HStack {
                    Text("Hg (Mercury)").bold()
                    Spacer()
                    Text("\(plant.plhgan ?? 0) lbs")
                }
            }
            Section("Data") {
                HStack {
                    Text("Source").bold()
                    Spacer()
                    Text("EPA EGrid 2020")
                }
//                VStack { Toggle("Show Raw", isOn: $showJSON)
//                    if showJSON {
//                        let raw = String(reflecting: plant).split(separator:", ").joined(separator: ",\n ")
//                        Text(raw).font(.caption).monospaced()
//                    }
//                }
            }
        }
        .navigationTitle(plant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlantDetail(plant: EGridPlant.example)
        }
    }
}
