//
//  CollectsController.swift
//  ShopifyMobileChallenge
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit


class CollectionDetailsController: UICollectionViewController {
    fileprivate var collectionsDataSource: CollectionViewDataSource<Product, CollectionListCell>?
    public var products: Products? {
        didSet {
            collectionsDataSource?.setData(dataSource: products?.products ?? [])
            collectionView.reloadData()
        }
    }

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white

        collectionsDataSource = CollectionViewDataSource(dataSource: products?.products ?? [], reuseIdentifier: "ProductCell", cellSetup: { (model: Product, cell: CollectionListCell) in
            cell.title = model.title
            CollectionsAPIManager.fetchImage(url: model.image.src, completion: { (image, error) in
                if error == nil {
                    cell.image = image
                }
            })
        })
        collectionView.register(CollectionListCell.self, forCellWithReuseIdentifier: "ProductCell")
        collectionView.dataSource = collectionsDataSource
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionDetailsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
}
