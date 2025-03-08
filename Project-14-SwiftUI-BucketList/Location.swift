//
//  Location.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 5/03/25.
//

import Foundation
import MapKit

struct Location: Codable, Identifiable, Equatable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double // Here don't use CLLocationCoordinate2D when for strange reason is not accepted by Codable
    var longitude: Double // Here don't use CLLocationCoordinate2D when for strange reason is not accepted by Codable
    
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
    
    #if DEBUG
        static let example = Location(
            id: UUID(),
            name: "Medellin",
            description: "Ciudad de la eterna primavera",
            latitude: 6.25,
            longitude: -75.56
        )
    #endif
    
}
