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
            center: CLLocationCoordinate2D(latitude: 3.9, longitude: -76.30),
            span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        )
    )
    
    @State private var locations = [Location]()
    
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Annotation(
                        location.name,
                        coordinate: location.coordinate
                    ) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                    }
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    let newLocation = Location(
                        id: UUID(),
                        name: "New Location",
                        description: "",
                        latitude: coordinate.latitude,
                        longitude: coordinate.longitude
                    )
                    locations.append(newLocation)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
