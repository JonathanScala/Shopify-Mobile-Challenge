//
//  ProductListCell.swift
//  ShopifyMobileChallenge
//
//  Created by Jonathan Scala on 2019-01-19.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit


class ProductListCell: UITableViewCell {
    fileprivate let productImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        //view.backgroundColor = .blue
        return view
    }()

    fileprivate let productTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        //label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
    }()

    fileprivate let collectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()

    public var productImage: UIImage? {
        didSet {
            productImageView.image = productImage
        }
    }

    public var productTitle: String? {
        didSet {
            productTitleLabel.text = productTitle
        }
    }

    public var collectionTitle: String? {
        didSet {
            collectionTitleLabel.text = collectionTitle
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImageView)
        addSubview(productTitleLabel)
        addSubview(collectionTitleLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        productImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        productImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / 3).isActive = true

        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        productTitleLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 0).isActive = true
        productTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2 / 3).isActive = true

        collectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionTitleLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor).isActive = true
        collectionTitleLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor).isActive = true
        collectionTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2 / 3).isActive = true
        
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
