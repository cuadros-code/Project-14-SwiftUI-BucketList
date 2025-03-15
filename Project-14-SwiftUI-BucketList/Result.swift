//
//  Result.swift
//  Project-14-SwiftUI-BucketList
//
//  Created by Kevin Cuadros on 15/03/25.
//

import Foundation


struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
