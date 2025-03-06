//
//  ContentView.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 8/02/25.
//

import SwiftUI
import MapKit




struct ContentView: View {
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition)
                .mapStyle(.hybrid)
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print("\(coordinate)")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
