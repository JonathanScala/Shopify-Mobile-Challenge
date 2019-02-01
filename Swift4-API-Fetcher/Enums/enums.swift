//
//  enums.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-17.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation


enum ShopifyLinks: CustomStringConvertible {
    case token
    case collectionsList
    case collects
    case products

    var description: String {
        switch self {
        case .collectionsList:
            return "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
        case .collects:
            return "https://shopicruit.myshopify.com/admin/collects.json"
        case .products:
            return "https://shopicruit.myshopify.com/admin/products.json"
        case .token:
            return "c32313df0d0ef512ca64d5b336a0d7c6"
        }
    }
}
