//
//  CollectsController.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit


class CollectionDetailsController: UITableViewController {
    fileprivate var collectionsDataSource: TableViewDataSource<Product, ProductListCell>?
    public var products: Products? {
        didSet {
            collectionsDataSource?.setData(dataSource: products?.products ?? [])
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        tableView.backgroundColor = .white

        collectionsDataSource = TableViewDataSource(dataSource: products?.products ?? [], reuseIdentifier: "ProductCell", cellSetup: { (model: Product, cell: ProductListCell) in
            cell.productTitle = model.title
            cell.collectionTitle = model.product_type
            cell.updatedTitle = model.updated_at
            cell.inventoryTitle = String(describing: model.variants.compactMap({ $0 }).reduce(0) {$0 + $1.inventory_quantity})
            CollectionsAPIManager.fetchImage(url: model.image.src, completion: { (image, error) in
                if error == nil {
                    cell.productImage = image
                }
            })
        })
        tableView.register(ProductListCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.dataSource = collectionsDataSource
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
