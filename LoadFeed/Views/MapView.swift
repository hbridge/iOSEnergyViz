//
//  MapView.swift
//  LoadFeed
//
//  Created by Henry Bridge on 1/6/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    let energySources: [EnergySource]
    let location: CLLocationCoordinate2D
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude),
        span: MKCoordinateSpan(latitudeDelta: MapDefaults.zoom, longitudeDelta: MapDefaults.zoom))
        
    private enum MapDefaults {
        static let latitude = 40.681165
        static let longitude = -73.995742
        static let zoom = 0.021
    }

    var body: some View {
        NavigationStack {
            VStack {
                Map(coordinateRegion: $region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    annotationItems: energySources
                ) { item in
                    MapAnnotation(coordinate: item.coordinate()) {
                        NavigationLink(value: item) {
                            Image(systemName: item.iconStyle()["icon"]!)
                                .foregroundColor(Color(item.iconStyle()["colorString"]!))
                        }
                    }
                }
                .navigationDestination(for: EnergySource.self) { item in
                    if let project = item as? SolarProject {
                        SolarDetail(project: project)
                    }
                    if let plant = item as? EGridPlant {
                        PlantDetail(plant: plant)
                    }
                    
                }
            }
        }.task {
            region = MKCoordinateRegion(
                center: location,
                span: MKCoordinateSpan(latitudeDelta: MapDefaults.zoom, longitudeDelta: MapDefaults.zoom)
            )
        }
    }
}

