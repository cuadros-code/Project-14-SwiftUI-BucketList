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
    
    @State private var viewModel = ViewModel()
    
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach( viewModel.locations) { location in
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
                            .simultaneousGesture(
                                LongPressGesture(
                                    minimumDuration: 0.2
                                ).onEnded { _ in
                                    viewModel.selectedPlace = location
                                }
                            )
                    }
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    viewModel.addLocation(at: coordinate)
                }
            }
            
            .sheet(item: $viewModel.selectedPlace) { place in
                EditLocationView(location: place) { newLocation in
                    viewModel.update(location: newLocation)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
