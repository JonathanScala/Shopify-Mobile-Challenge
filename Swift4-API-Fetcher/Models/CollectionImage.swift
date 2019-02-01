//
//  CollectionImage.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation


struct CollectionImage: Codable {
    let alt: String?
    let created_at: String
    let height: Float
    let src: String
    let width: Float
}
