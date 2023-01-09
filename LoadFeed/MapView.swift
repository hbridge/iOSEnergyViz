//
//  MapView.swift
//  LoadFeed
//
//  Created by Henry Bridge on 1/6/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude),
        span: MKCoordinateSpan(latitudeDelta: MapDefaults.zoom, longitudeDelta: MapDefaults.zoom))
        
    private enum MapDefaults {
        static let latitude = 40.681165
        static let longitude = -73.995742
        static let zoom = 0.021
    }

    var body: some View {
        VStack {
            Text("lat: \(region.center.latitude), long: \(region.center.longitude). Zoom: \(region.span.latitudeDelta)")
            .font(.caption)
            .padding()
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true)
        }
    }
}
