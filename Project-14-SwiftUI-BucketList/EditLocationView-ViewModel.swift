//
//  EditLocationView-ViewModel.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 18/03/25.
//

import Foundation


extension EditLocationView {
    
    @Observable
    class ViewModel {
        
        enum LoadingState {
            case loading, loaded, failed
        }
        
        var name: String
        var description: String
        var pages = [Page]()
        var location: Location
        
        var loadingState = LoadingState.loading
        
        var onSave: (Location) -> Void
        
        init(
            name: String,
            description: String,
            location: Location,
            onSave: @escaping (Location) -> Void
        ) {
            self.name = name
            self.description = description
            self.location = location
            self.onSave = onSave
        }
        
        func save() {
            var newLocation = location
            newLocation.id = UUID()
            newLocation.name = name
            newLocation.description = description
            
            onSave(newLocation)
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad Url")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
            
        }
        
    }
    
}
