//
//  Data.swift
//  LoadFeed
//
//  Created by Henry Bridge on 12/16/22.
//

import Foundation
import CoreLocation

struct EGridPlantResults: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [EGridPlant]
}

struct EGridPlant: Codable, Identifiable, Hashable {
    var pid: Int
    var pname: String?
    var lat: Double?
    var lon: Double?
    var location: String?
    var pstatabb: String?
    var oprname: String?
    var utlsrvnm: String?
    var numunt: Int16?
    var numgen: Int16?
    var plprmfl: String?
    var plfuelct: String?
    var coalflag: Bool?
    var capfac: String?
    var namepcap: Float?
    var plngenan: Int?
    var plngenoz: Int?
    var plnoxan: Int?
    var plnoxoz: Int?
    var plso2an: Int?
    var plco2an: Int?
    var plch4an: Int?
    var pln2oan: Int?
    var plco2eqa: Int?
    var plhgan: Int?
    
    var id: Int {
        get {
            return pid
        }
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: self.lat!,
            longitude: self.lon!
        )
    }
    
#if DEBUG
    static let example = EGridPlant(
        pid: 8104,
        pname: "Bayonne Energy Center",
        lat: 40.652834,
        lon: -74.09155,
        location: "SRID=4326;POINT (-74.09155 40.652834)",
        pstatabb: "NJ",
        oprname: "Consolidated Edison Co-NY Inc",
        utlsrvnm: "Bayonne Energy Center LLC",
        numunt: 10,
        numgen: 10,
        plprmfl: "NG",
        plfuelct: "GAS",
        coalflag: false,
        capfac: "0.0617",
        namepcap: 644.0,
        plngenan: 347827,
        plngenoz: 250137,
        plnoxan: 15,
        plnoxoz: 8,
        plso2an: 1,
        plco2an: 206382,
        plch4an: 7943,
        pln2oan: 794,
        plco2eqa: 206600
    )
#endif
}
