//
//  TableViewDataSource.swift
//  ShopifyMobileChallenge
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit


class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        let model = dataSource[indexPath.row]
        cellSetup(model, cell)
        return cell
    }
}
