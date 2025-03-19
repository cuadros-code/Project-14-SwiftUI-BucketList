//
//  EditLocationView.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 9/03/25.
//

import SwiftUI

struct EditLocationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button("Save") {
                    viewModel.save()
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
            
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        viewModel = ViewModel(
            name: location.name,
            description: location.description,
            location: location,
            onSave: onSave
        )

    }
    
    
    
}

#Preview {
    EditLocationView(location: .example) { _ in }
}
