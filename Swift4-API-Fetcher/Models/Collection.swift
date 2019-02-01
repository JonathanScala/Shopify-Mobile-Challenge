//
//  CollectionModel.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation


struct Collection: Codable {
    let admin_graphql_api_id: String
    let body_html: String
    let handle: String
    let id: Int
    let image: CollectionImage
    let published_at: String
    let published_scope: String
    let sort_order: String
    let template_suffix: String
    let title: String
    let updated_at: String
}
