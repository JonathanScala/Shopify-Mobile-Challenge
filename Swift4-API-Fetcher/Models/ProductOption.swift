//
//  ProductOption.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation


struct ProductOption: Codable {
    let id: Int
    let product_id: Int
    let name: String
    let position: Int
    let values: [String]
}
