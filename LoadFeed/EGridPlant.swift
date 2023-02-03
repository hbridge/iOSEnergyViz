//
//  Data.swift
//  LoadFeed
//
//  Created by Henry Bridge on 12/16/22.
//

import Foundation
import CoreLocation

struct EGridPlantResults: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [EGridPlant]
}

class EGridPlant: EnergySource {
    var pid: Int
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
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pid = try values.decode(Int.self, forKey: .pid)
        lat = try? values.decode(Double.self, forKey: .lat)
        lon = try? values.decode(Double.self, forKey: .lon)
        location = try? values.decode(String.self, forKey: .location)
        pstatabb = try? values.decode(String.self, forKey: .pstatabb)
        oprname = try? values.decode(String.self, forKey: .oprname)
        utlsrvnm = try? values.decode(String.self, forKey: .utlsrvnm)
        numunt = try? values.decode(Int16.self, forKey: .numunt)
        numgen = try? values.decode(Int16.self, forKey: .numgen)
        plprmfl = try? values.decode(String.self, forKey: .plprmfl)
        plfuelct = try? values.decode(String.self, forKey: .plfuelct)
        coalflag = try? values.decode(Bool.self, forKey: .coalflag)
        capfac = try? values.decode(String.self, forKey: .capfac)
        namepcap = try? values.decode(Float.self, forKey: .namepcap)
        plngenan = try? values.decode(Int.self, forKey: .plngenan)
        plngenoz = try? values.decode(Int.self, forKey: .plngenoz)
        plnoxan = try? values.decode(Int.self, forKey: .plnoxan)
        plnoxoz = try? values.decode(Int.self, forKey: .plnoxoz)
        plso2an = try? values.decode(Int.self, forKey: .plso2an)
        plco2an = try? values.decode(Int.self, forKey: .plco2an)
        plch4an = try? values.decode(Int.self, forKey: .plch4an)
        pln2oan = try? values.decode(Int.self, forKey: .pln2oan)
        plco2eqa = try? values.decode(Int.self, forKey: .plco2eqa)
        plhgan = try? values.decode(Int.self, forKey: .plhgan)
        
        let pname = try values.decode(String.self, forKey: .pname)
        super.init(sourceId: "EG\(self.pid)", name: pname)
    }
    
    enum CodingKeys: String, CodingKey {
        case pid
        case pname
        case lat
        case lon
        case location
        case pstatabb
        case oprname
        case utlsrvnm
        case numunt
        case numgen
        case plprmfl
        case plfuelct
        case coalflag
        case capfac
        case namepcap
        case plngenan
        case plngenoz
        case plnoxan
        case plnoxoz
        case plso2an
        case plco2an
        case plch4an
        case pln2oan
        case plco2eqa
        case plhgan
    }
    
    init(pid: Int, pname: String, lat: Double? = nil, lon: Double? = nil, location: String? = nil, pstatabb: String? = nil, oprname: String? = nil, utlsrvnm: String? = nil, numunt: Int16? = nil, numgen: Int16? = nil, plprmfl: String? = nil, plfuelct: String? = nil, coalflag: Bool? = nil, capfac: String? = nil, namepcap: Float? = nil, plngenan: Int? = nil, plngenoz: Int? = nil, plnoxan: Int? = nil, plnoxoz: Int? = nil, plso2an: Int? = nil, plco2an: Int? = nil, plch4an: Int? = nil, pln2oan: Int? = nil, plco2eqa: Int? = nil, plhgan: Int? = nil) {
        self.pid = pid
        self.lat = lat
        self.lon = lon
        self.location = location
        self.pstatabb = pstatabb
        self.oprname = oprname
        self.utlsrvnm = utlsrvnm
        self.numunt = numunt
        self.numgen = numgen
        self.plprmfl = plprmfl
        self.plfuelct = plfuelct
        self.coalflag = coalflag
        self.capfac = capfac
        self.namepcap = namepcap
        self.plngenan = plngenan
        self.plngenoz = plngenoz
        self.plnoxan = plnoxan
        self.plnoxoz = plnoxoz
        self.plso2an = plso2an
        self.plco2an = plco2an
        self.plch4an = plch4an
        self.pln2oan = pln2oan
        self.plco2eqa = plco2eqa
        self.plhgan = plhgan
        super.init(sourceId: "EG\(self.pid)", name: pname)
    }
    
    
    
    override func coordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: self.lat!,
            longitude: self.lon!
        )
    }
    
    override func fuelType() -> String {
        self.plfuelct ?? "Unknown"
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
