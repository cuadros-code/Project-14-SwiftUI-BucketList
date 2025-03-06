//
//  LocationModel.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 20/02/25.
//

import Foundation
import MapKit

struct LocationModel: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
