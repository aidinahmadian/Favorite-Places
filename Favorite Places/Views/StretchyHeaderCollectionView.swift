//
//  StretchyHeaderCollectionView.swift
//  Favorite Places
//
//  Created by aidin ahmadian on 10/25/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit

class StretchyHeaderCollectionView: UICollectionViewCell {
    
    var PlaceArtwork: Places? {
        didSet {
            guard let listItem = PlaceArtwork else {return}
            
            if let imageName = listItem.imageName {
                placeImageView.image = UIImage(named: imageName)
            }
            if let placeName = listItem.placeName {
                placeNameLabel.text = placeName
            }
            if let placeAddress = listItem.placeAddress {
                placeAddressLabel.text = placeAddress
            }
        }
    }
    
    let placeImageView: UIImageView = {
        let piv = UIImageView()
        piv.image = UIImage(named: "firstpic")
        piv.clipsToBounds  = true
        piv.backgroundColor = .green
        piv.translatesAutoresizingMaskIntoConstraints = false
        piv.layer.cornerRadius = 10
        piv.contentMode = .scaleAspectFill
        return piv
    }()
    
    let placeNameLabel: UILabel = {
       let pnl = UILabel()
        pnl.translatesAutoresizingMaskIntoConstraints = false
        pnl.font = UIFont.boldSystemFont(ofSize: 18)
        pnl.textColor = .black
        //pnl.backgroundColor = .red
        pnl.text = "New York City"
        return pnl
    }()
    
    let placeAddressLabel: UILabel = {
       let pal = UILabel()
        pal.translatesAutoresizingMaskIntoConstraints = false
        pal.font = UIFont.systemFont(ofSize: 15)
        pal.textColor = .gray
        //pal.backgroundColor = .yellow
        pal.text = "Empire state"
        return pal
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        addSubview(placeImageView)
        addSubview(placeNameLabel)
        addSubview(placeAddressLabel)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-[v1(22)]-[v2(20)]-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": placeImageView, "v1": placeNameLabel, "v2": placeAddressLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": placeImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-110-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": placeNameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-110-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": placeAddressLabel]))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
