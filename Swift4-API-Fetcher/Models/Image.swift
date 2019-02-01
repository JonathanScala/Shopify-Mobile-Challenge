//
//  Image.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation


struct Image: Codable {
    let id: Int
    let product_id: Int
    let position: Int
    let created_at: String
    let updated_at: String
    let alt: String?
    let width: Float
    let height: Float
    let src: String
    let variant_ids: [Int]
    let admin_graphql_api_id: String
}
