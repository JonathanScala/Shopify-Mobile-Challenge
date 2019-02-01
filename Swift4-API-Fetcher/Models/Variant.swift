//
//  Variant.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation


struct Variant: Codable {
    let id: Int
    let product_id: Int
    let title: String
    let price: String
    let sku: String
    let position: Int
    let inventory_policy: String
    let compare_at_price: String?
    let fulfillment_service: String
    let inventory_management: String?
    let option1: String?
    let option2: String?
    let option3: String?
    let created_at: String
    let updated_at: String
    let taxable: Bool
    let barcode: String?
    let grams: Int
    let image_id: Int?
    let weight: Float
    let weight_unit: String
    let inventory_item_id: Int
    let inventory_quantity: Int
    let old_inventory_quantity: Int
    let requires_shipping: Bool
    let admin_graphql_api_id: String
}
