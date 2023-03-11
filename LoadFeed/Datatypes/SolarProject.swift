//
//  Data.swift
//  LoadFeed
//
//  Created by Henry Bridge on 12/16/22.
//

import Foundation
import CoreLocation

class SolarProject: EnergySource {
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
    
    enum CodingKeys: String, CodingKey {
        case project_number
        case city
        case state
        case zip_code
        case sector
        case project_status
        case inverter_manufacturer
        case primary_inverter_model_number
        case pv_module_model_number
        case pv_module_quantity
        case project_cost
        case incentive = "total_nyserda_incentive"
        case totalnameplatekwdc
        case expected_kwh_annual_production
        case latitude
        case longitude
        case street_address
    }
    
    init(project_number: String, city: String, state: String, zip_code: String, sector: String, project_status: String, inverter_manufacturer: String? = nil, primary_inverter_model_number: String? = nil, pv_module_model_number: String? = nil, pv_module_quantity: String? = nil, project_cost: String? = nil, incentive: String? = nil, totalnameplatekwdc: String? = nil, expected_kwh_annual_production: String? = nil, latitude: String, longitude: String, street_address: String? = nil) {
        self.city = city
        self.state = state
        self.zip_code = zip_code
        self.sector = sector
        self.project_status = project_status
        self.inverter_manufacturer = inverter_manufacturer
        self.primary_inverter_model_number = primary_inverter_model_number
        self.pv_module_model_number = pv_module_model_number
        self.pv_module_quantity = pv_module_quantity
        self.project_cost = project_cost
        self.incentive = incentive
        self.totalnameplatekwdc = totalnameplatekwdc
        self.expected_kwh_annual_production = expected_kwh_annual_production
        self.latitude = latitude
        self.longitude = longitude
        self.street_address = street_address
        super.init(sourceId: project_number, name: street_address ?? project_number)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let pnumber = try values.decode(String.self, forKey: .project_number)
        city = try values.decode(String.self, forKey: .city)
        state = try values.decode(String.self, forKey: .state)
        zip_code = try values.decode(String.self, forKey: .zip_code)
        sector = try values.decode(String.self, forKey: .sector)
        project_status = try values.decode(String.self, forKey: .project_status)
        inverter_manufacturer = try? values.decode(String.self, forKey: .inverter_manufacturer)
        primary_inverter_model_number = try? values.decode(String.self, forKey: .primary_inverter_model_number)
        pv_module_model_number = try? values.decode(String.self, forKey: .pv_module_model_number)
        pv_module_quantity = try? values.decode(String.self, forKey: .pv_module_quantity)
        project_cost = try? values.decode(String.self, forKey: .project_cost)
        incentive = try? values.decode(String.self, forKey: .incentive)
        totalnameplatekwdc = try? values.decode(String.self, forKey: .totalnameplatekwdc)
        expected_kwh_annual_production = try? values.decode(String.self, forKey: .expected_kwh_annual_production)
        latitude = try values.decode(String.self, forKey: .latitude)
        longitude = try values.decode(String.self, forKey: .longitude)
        street_address = try? values.decode(String.self, forKey: .street_address)
        
        super.init(sourceId: pnumber, name: street_address ?? pnumber)
    }
    
    override func coordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: CLLocationDegrees(self.latitude)!,
            longitude: CLLocationDegrees(self.longitude)!
        )
    }
    
    override func fuelType() -> String {"SOLAR"}
    override func fuelCategory() -> String {"SOLAR"}
    
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
