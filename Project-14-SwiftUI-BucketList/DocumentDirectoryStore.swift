//
//  DocumentDirectoryStore.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 9/02/25.
//

import SwiftUI

struct DocumentDirectoryStore: View {
    var body: some View {
        Button("Write", action: writeDocument)
            .padding()
        
        Button("Read", action: readDocument)
            .padding()
    }
    
    func writeDocument() {
        print(URL.documentsDirectory)
        let data = Data("Test Message".utf8)
        
        let url = URL.documentsDirectory.appending(path: "message.txt")
        
        do {
            try data.write(to: url, options: [.atomic, .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readDocument() {
        let url = URL.documentsDirectory.appending(path: "message.txt")
        do {
            let data = try String(contentsOf: url, encoding: .utf8)
            print(data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    DocumentDirectoryStore()
}
