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
        
        if viewModel.isUnlocked {
            ZStack(alignment: .topTrailing) {
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
                    
                    .mapStyle(viewModel.mapStyle)
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
                Button {
                    viewModel.mapStyleState.toggle()
                } label: {
                    Image(systemName: "sun.max.fill")
                        .font(.title)
                        .padding(4)
                        .foregroundStyle(
                            viewModel.mapStyleState ? .white : .gray
                        )
                        .background(.black.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                }
                .padding([.top], 60)
                .padding([.trailing], 5)
                
                
                
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
            
                .alert(isPresented: $viewModel.authenticateError) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Failed to authenticate, please try again.")
                    )
                }
        }
    }
}

#Preview {
    ContentView()
}
