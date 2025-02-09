//
//  ContentView.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 8/02/25.
//

import SwiftUI

struct User: Identifiable, Comparable {
    
    let id = UUID()
    var firstName: String
    var lastName: String
    
    // Required when add Comparable protocol
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.firstName < rhs.firstName
    }
    
}

struct ContentView: View {
    
    let values = [1, 5, 2, 3, 6, 4].sorted()
    
    let users = [
        User(firstName: "Kevin", lastName: "Cuadros"),
        User(firstName: "Andres", lastName: "Montes"),
        User(firstName: "Camila", lastName: "Torrez")
    ].sorted()
    
    var body: some View {
        List(values, id: \.self) { i in
            Text("\(i)")
        }
        List(users) { i in
            Text("\(i.firstName) \(i.lastName)")
        }
    }
}

#Preview {
    ContentView()
}
