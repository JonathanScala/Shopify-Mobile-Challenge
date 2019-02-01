//
//  CollectionViewDataSource.swift
//  Swift4-API-Fetcher
//
//  Created by Jonathan Scala on 2019-01-18.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit


class CollectionViewDataSource<Model, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource {
    typealias CellSetup = (Model, Cell) -> Void
    public fileprivate(set) var dataSource: [Model]
    fileprivate let reuseIdentifier: String
    fileprivate let cellSetup: CellSetup

    init(dataSource: [Model], reuseIdentifier: String, cellSetup: @escaping CellSetup) {
        self.dataSource = dataSource
        self.reuseIdentifier = reuseIdentifier
        self.cellSetup = cellSetup
    }

    func setData(dataSource: [Model]) {
        self.dataSource = dataSource
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        let model = dataSource[indexPath.row]
        cellSetup(model, cell)
        return cell
    }
}
