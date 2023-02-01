//
//  Data.swift
//  LoadFeed
//
//  Created by Henry Bridge on 12/16/22.
//

import Foundation
import CoreLocation

struct SolarProject: Codable, Identifiable, Hashable {
    var project_number: String
    var city: String
    var state: String
    var zip_code: String
    var sector: String
    var project_status: String
    var inverter_manufacturer: String?
    var primary_inverter_model_number: String?
    var pv_module_model_number: String?
    var pv_module_quantity: String?
    var project_cost: String?
    var incentive: String?
    var totalnameplatekwdc: String?
    var expected_kwh_annual_production: String?
    var latitude: String
    var longitude: String
    var street_address: String?
    
    var id: String {
        get {
            return project_number
        }
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: CLLocationDegrees(self.latitude)!,
            longitude: CLLocationDegrees(self.longitude)!
        )
    }
    
#if DEBUG
    static let example = SolarProject(
        project_number: "12345",
        city: "Brooklyn",
        state: "New York",
        zip_code: "11231",
        sector: "Residential",
        project_status: "Pipeline",
        inverter_manufacturer: "SunPower",
        pv_module_model_number: "SPR-X22-360-E-AC [240V]",
        pv_module_quantity: "8.00",
        project_cost: "20000.00",
        incentive: "500.00",
        totalnameplatekwdc: "2.88",
        expected_kwh_annual_production: "3228",
        latitude: "40.6092526",
        longitude: "-73.9483771",
        street_address: "123 Fulton Ave"
    )
#endif
}
