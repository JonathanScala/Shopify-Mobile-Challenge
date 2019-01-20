//
//  CustomCollectionsController.swift
//  ShopifyMobileChallenge
//
//  Created by Jonathan Scala on 2019-01-17.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit
import Alamofire
import FontAwesome_swift


class CustomCollectionsController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(CollectionListCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()
    var customCollections: CustomCollections?
    var collectionsDataSource: CollectionViewDataSource<Collection, CollectionListCell>?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        
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
                // f2bd
            }
        }
    }

    fileprivate func setUpView() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            //navigationItem.largeTitleDisplayMode = .automatic
            navigationItem.title = "Home"
        }
        let userIcon = UIImage.fontAwesomeIcon(name: .userCircle, style: .solid, textColor: .gray, size: CGSize(width: 40, height: 40))

        let rightBarButtonItem: UIBarButtonItem = {
            let x = UIBarButtonItem(image: userIcon, style: UIBarButtonItem.Style.plain, target: self, action: nil)
            return x
        }()

        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 10, vertical: 20), for: UIBarMetrics.default)
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
            //self.navigationController?.navigationBar.topItem?.title = cell.title

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
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}
