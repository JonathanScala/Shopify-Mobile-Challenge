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
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    fileprivate var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let bv = UIVisualEffectView(effect: blurEffect)
        return bv
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
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.insertSubview(blurView, at: 0)
        //self.backgroundColor = .darkValue
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3 / 4).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1 / 4).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true

        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blurView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        blurView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    static let darkValue = UIColor(red: 0x36/255.0, green: 0x39/255.0, blue: 0x3E/255.0, alpha: 1.0)
    static let lightBlue = UIColor(red: 0x24/255, green: 0xAB/255, blue: 0xFF/255, alpha: 1.0)
    static let darkBackground = UIColor(red: 0x46/255.0, green: 0x4A/255.0, blue: 0x4F/255.0, alpha: 1.0)
}
