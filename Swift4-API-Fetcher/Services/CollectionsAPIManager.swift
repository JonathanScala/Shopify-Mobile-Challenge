//
//  CollectionsAPIManager.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import Foundation
import Alamofire


class CollectionsAPIManager {
    static let imageCache = NSCache<NSString, UIImage>()
    class func fetchCollections(completion: @escaping (_ collections: CustomCollections?, _ error: Error?) -> Void) {
        guard let url = URL(string: ShopifyLinks.collectionsList.description) else {
            return
        }
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                ObjectifyJSON(json: response.data!, completion: completion)
            case .failure:
                print("Failed to fetch collections with error: \(String(describing: response.result.error?.localizedDescription))")
                completion(nil, response.result.error)
            }
        }
    }

    class func fetchCollects(collectionId: Int?, completion: @escaping (_ collects: Collects?, _ error: Error?) -> Void) {
        guard let collectionId = collectionId else {
            return
        }
        let parameters: Parameters = ["collection_id": collectionId, "page": 1, "access_token": ShopifyLinks.token.description]
        AF.request(ShopifyLinks.collects.description, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                ObjectifyJSON(json: response.data!, completion: completion)
            case .failure:
                print("Failed to fetch a list of collects with error: \(String(describing: response.result.error?.localizedDescription))")
                completion(nil, response.result.error)
            }
        }
    }

    class func fetchProducts(productIds: String?, completion: @escaping (_ products: Products?, _ error: Error?) -> Void) {
        guard let productIds = productIds else {
            return
        }
        let parameters: Parameters = ["ids": productIds, "page": 1, "access_token": ShopifyLinks.token.description]
        AF.request(ShopifyLinks.products.description, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                ObjectifyJSON(json: response.data!, completion: completion)
            case .failure:
                print("Failed to fetch a list of collects with error: \(String(describing: response.result.error?.localizedDescription))")
                completion(nil, response.result.error)
            }
        }
    }

    class func fetchImage(url: String, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        // Cache the images downloaded
        if let image = imageCache.object(forKey: url as NSString) {
            DispatchQueue.main.async {
                completion(image, nil)
            }
            return
        }
        AF.download(url).responseData { response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    let image = UIImage(data: response.result.value!)
                    imageCache.setObject(image!, forKey: url as NSString)
                    completion(image, nil)
                }
            case .failure:
                print("Failed to fetch image with error: \(String(describing: response.result.error?.localizedDescription))")
                completion(nil, response.result.error)
            }
        }
    }

    fileprivate class func ObjectifyJSON<T: Decodable>(json: Data, completion: @escaping (_ collections: T?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            let collection = try decoder.decode(T.self, from: json)
            // Pass the Decoded JSON as a Model
            DispatchQueue.main.async {
                completion(collection, nil)
            }
        } catch let error {
            print("Error Decoding JSON: \(error)")
            // Decoding Error
            completion(nil, error)
        }
    }

}
