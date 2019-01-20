//
//  CollectionListCell.swift
//  ShopifyMobileChallenge
//
//  Created by Jonathan Scala on 2019-01-18.
//  Copyright © 2019 Jonathan Scala. All rights reserved.
//

import UIKit


class CollectionListCell: UICollectionViewCell {
    fileprivate let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    fileprivate var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    public var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }

    public var title: String? = "" {
        didSet {
            titleLabel.text = title
        }
    }

    public var collectionID: Int?

    public var imageContentMode: UIView.ContentMode = .scaleAspectFill {
        didSet {
            imageView.contentMode = imageContentMode
        }
    }

    public func setUp(title: String?, image: UIImage?, ID: Int?) {
        self.image = image
        self.title = title
        self.collectionID = ID
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
