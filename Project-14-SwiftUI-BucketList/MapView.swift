//
//  MapView.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 12/02/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var locations = [
        LocationModel(
            name: "Palace",
            coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)
        ),
        LocationModel(
            name: "Tower of London",
            coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)
        )
    ]
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    )
    
    var body: some View {
        VStack {
            MapReader { proxy in
                Map(position: $position, interactionModes: [.all]) {
                    ForEach(locations) { location in
                        // Marker(location.name, coordinate: location.coordinate)
                        Annotation(location.name, coordinate: location.coordinate) {
                            Text(location.name)
                                .font(.headline)
                                .padding()
                                .background(.blue.gradient)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                        .annotationTitles(.hidden)
                    }
                }
                .mapStyle(.hybrid(elevation: .realistic))
                .onMapCameraChange(frequency: .continuous) { context in
                    print(context.camera)
                }
                .onTapGesture { pos in
                    if let coordinate = proxy.convert(pos, from: .local) {
                        let newPosition = LocationModel(
                            name: "\(coordinate.longitude)",
                            coordinate: coordinate
                        )
                        locations.append(newPosition)
                    }
                    
                }
            }
            
            HStack(spacing: 50) {
                Button("Paris") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: 48.8566,
                                longitude: 2.3522
                            ),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
                
                Button("Tokio") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: 35.6897,
                                longitude: 139.6922
                            ),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    MapView()
}
