//
//  CustomCollectionsController.swift
//  ShopifyMobileChallenge
//
//  Created by Jonathan Scala on 2019-01-17.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit
import Alamofire


class CustomCollectionsController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(CollectionListCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()
    var customCollections: CustomCollections?
    var collectionsDataSource: CollectionViewDataSource<Collection, CollectionListCell>?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)

        // Fetch the Collection List
        CollectionsAPIManager.fetchCollections { (collection, error)  in
            if (error == nil) {
                let datasource = CollectionViewDataSource(dataSource: collection!.custom_collections, reuseIdentifier: "Cell", cellSetup: { (model: Collection, cell: CollectionListCell) in
                    cell.title = model.title
                    cell.collectionID = model.id
                    CollectionsAPIManager.fetchImage(url: model.image.src, completion: { (image, error) in
                        if (error == nil) {
                            cell.image = image
                        }
                    })
                })
                self.customCollections = collection
                self.collectionsDataSource = datasource
                self.collectionView.dataSource = self.collectionsDataSource
                self.collectionView.delegate = self
            }
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}


extension CustomCollectionsController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionListCell else {
            return
        }
        DispatchQueue.main.async {
            let vc = CollectionDetailsController()
            self.navigationController?.pushViewController(vc, animated: true)
            CollectionsAPIManager.fetchCollects(collectionId: cell.collectionID) { (collects, error) in
                if (error == nil) {
                    // Turn the Int IDs into a comma separated String
                     let ids = collects!.collects.map({ String(describing: $0.product_id) }).joined(separator: ",")
                     CollectionsAPIManager.fetchProducts(productIds: ids, completion: { (products, error) in
                        if (error == nil) {
                            vc.products = products
                        }
                     })
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
}
