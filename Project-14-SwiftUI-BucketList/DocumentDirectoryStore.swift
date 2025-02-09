//
//  DocumentDirectoryStore.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 9/02/25.
//

import SwiftUI

struct DocumentDirectoryStore: View {
    var body: some View {
        Button("Document", action: test)
    }
    
    func test() {
        print(URL.documentsDirectory)
    }
}

#Preview {
    DocumentDirectoryStore()
}
