//
//  Data.swift
//  LoadFeed
//
//  Created by Henry Bridge on 12/16/22.
//

import Foundation
import CoreLocation

class EnergySource: Decodable, Identifiable, Hashable {
    var sourceId: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case sourceId = "id"
        case name
    }
    
    init(sourceId: String, name: String) {
        self.sourceId = sourceId
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sourceId = try values.decode(String.self, forKey: .sourceId)
        name =  try values.decode(String.self, forKey: .name)
    }

    
    static func == (lhs: EnergySource, rhs: EnergySource) -> Bool {
        return lhs.sourceId == rhs.sourceId
    }
    
    func hash(into hasher: inout Hasher) {
        return sourceId.hash(into: &hasher)
    }
    
    func coordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: 0.0,
            longitude: 0.0
        )
    }
    
    func fuelType() -> String { "Unknown" }
    func iconStyle() -> Dictionary<String, String> {
        switch self.fuelType() {
        case "BIOMASS":
            return [
                "icon": "b.circle.fill",
                "colorString": "Biomass"
            ]
        case "COAL":
            return [
                "icon": "c.circle.fill",
                "colorString": "Coal"
            ]
        case "OFSL":
            return [
                "icon": "f.circle.fill",
                "colorString": "Fossil"
            ]
        case "GAS":
            return [
                "icon": "g.circle.fill",
                "colorString": "Gas"
            ]
        case "GEOTHERMAL":
            return [
                "icon": "g.circle.fill",
                "colorString": "Geothermal"
            ]
        case "HYDRO":
            return [
                "icon": "h.circle.fill",
                "colorString": "Hydro"
            ]
        case "NUCLEAR":
            return [
                "icon": "n.circle.fill",
                "colorString": "Nuclear"
            ]
        case "OIL":
            return [
                "icon": "cylinder.split.1x2.fill",
                "colorString": "Oil"
            ]
        case "SOLAR":
            return [
                "icon": "sun.max.circle.fill",
                "colorString": "Solar"
            ]
        case "OTHF":
            return [
                "icon": "questionmark.circle.fill",
                "colorString": "Wasteheat"
            ]
       
        default:
            return [
                "icon": "questionmark.circle.fill",
                "colorString": "UnknownColor"
            ]
        }
    }
}
