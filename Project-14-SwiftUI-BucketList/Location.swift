//
//  Location.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 5/03/25.
//

import Foundation

struct Location: Codable, Identifiable, Equatable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double // Here don't use CLLocationCoordinate2D when for strange reason is not accepted by Codable
    var longitude: Double // Here don't use CLLocationCoordinate2D when for strange reason is not accepted by Codable
}
