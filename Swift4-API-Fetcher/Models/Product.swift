//
//  ProductModel.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation


struct Product: Codable {
    let id: Int
    let title: String
    let body_html: String
    let vendor: String
    let product_type: String
    let created_at: String
    let handle: String
    let updated_at: String
    let published_at: String
    let template_suffix: String?
    let tags: String
    let published_scope: String
    let admin_graphql_api_id: String
    let variants: [Variant]
    let options: [ProductOption]
    let images: [Image]
    let image: Image
}
