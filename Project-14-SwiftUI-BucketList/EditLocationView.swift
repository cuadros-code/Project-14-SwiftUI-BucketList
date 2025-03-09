//
//  EditLocationView.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 9/03/25.
//

import SwiftUI

struct EditLocationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var location: Location
    
    @State private var name: String
    @State private var description: String
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button("Save") {
                    dismiss()
                }
            }
            
        }
    }
    
    init(location: Location) {
        self.location = location
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
        
    }
}

#Preview {
    EditLocationView(location: .example)
}
