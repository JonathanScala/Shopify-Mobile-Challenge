//
//  CollectViewModel.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation


struct Collect: Codable {
    let collection_id: Int
    let created_at: String
    let featured: Bool
    let id: Int
    let position: Int
    let product_id: Int
    let sort_value: String
    let updated_at: String
}
