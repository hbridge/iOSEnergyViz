//
//  Helpers.swift
//  LoadFeed
//
//  Created by Henry Bridge on 3/11/23.
//

import Foundation

func valueOrUnknown(_ value: String?) -> String {
    let result = value ?? ""
    if result == "" {
        return "Unknown"
    }
    return result
}
