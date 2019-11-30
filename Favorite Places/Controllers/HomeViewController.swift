//
//  HomeViewController.swift
//  Favorite Places
//
//  Created by aidin ahmadian on 10/24/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit

class HomeViewController: UIViewController {
    
    let cellId = "HomeViewControllerCellId"
    let placeLists = PlacesAPI.getLists()
    
    let buildingLogo: UIImageView = {
       let bl = UIImageView()
        bl.clipsToBounds  = true
        bl.translatesAutoresizingMaskIntoConstraints = false
        bl.contentMode = .scaleAspectFill
        bl.image = UIImage(named: "building3")
        return bl
    }()
    
    let searchButton: UIButton = {
       let sb = UIButton()
        //sb.backgroundColor = .red
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.setImage(UIImage(named: "search"), for: .normal)
        return sb
    }()
    
    let cityImage: UIImageView = {
       let ci = UIImageView()
        ci.translatesAutoresizingMaskIntoConstraints = false
        ci.contentMode = .scaleAspectFit
        ci.image = UIImage(named: "cityimage")
        return ci
    }()
    
    let titleLabel: UILabel = {
       let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Explore New York"
        tl.font = UIFont.boldSystemFont(ofSize: 25)
        tl.textColor = #colorLiteral(red: 0.09688208252, green: 0.1148202643, blue: 0.2268413305, alpha: 1)
        return tl
    }()
    
    let secondTitleLabel: UILabel = {
       let stl = UILabel()
        stl.translatesAutoresizingMaskIntoConstraints = false
        stl.text = "The City of Flowers"
        stl.font = UIFont.boldSystemFont(ofSize: 17)
        stl.textColor = #colorLiteral(red: 0.9019607843, green: 0.1490196078, blue: 0.2235294118, alpha: 1)
        return stl
    }()
    
    let thirdTitleLabel: UILabel = {
       let ttl = UILabel()
        ttl.translatesAutoresizingMaskIntoConstraints  = false
        ttl.font = UIFont.systemFont(ofSize: 17)
        ttl.text = "Don't know where you are going today?"
        ttl.textColor = .gray
        return ttl
    }()
    
    let forthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "We have some \nRecommendations for you"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var favoritePlacesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       let cvv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cvv.dataSource = self
        cvv.delegate = self
        cvv.translatesAutoresizingMaskIntoConstraints = false
        return cvv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupView() {
        view.addSubview(buildingLogo)
        view.addSubview(searchButton)
        view.addSubview(cityImage)
        view.addSubview(titleLabel)
        view.addSubview(secondTitleLabel)
        view.addSubview(thirdTitleLabel)
        view.addSubview(favoritePlacesCollectionView)
        view.addSubview(forthTitleLabel)
        favoritePlacesCollectionView.register(FavoritePlacesCollectionView.self, forCellWithReuseIdentifier: cellId)
        favoritePlacesCollectionView.backgroundColor = .white
    }
    
    func setupConstraints() {
        
        buildingLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive  = true
        buildingLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        buildingLogo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buildingLogo.widthAnchor.constraint(equalToConstant: 40).isActive  = true
        
        searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive  = true
        searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 25).isActive  = true
        
        cityImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive  = true
        cityImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 130).isActive = true
        cityImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        cityImage.widthAnchor.constraint(equalToConstant: 300).isActive  = true
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive  = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14).isActive  = true
        
        secondTitleLabel.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.topAnchor, constant: 40).isActive  = true
        secondTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14).isActive = true
        secondTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14).isActive  = true
        
        thirdTitleLabel.topAnchor.constraint(equalTo: secondTitleLabel.safeAreaLayoutGuide.topAnchor, constant: 60).isActive  = true
        thirdTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14).isActive = true
        thirdTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14).isActive  = true
        
        forthTitleLabel.topAnchor.constraint(equalTo: thirdTitleLabel.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        forthTitleLabel.bottomAnchor.constraint(equalTo: favoritePlacesCollectionView.topAnchor, constant: -10).isActive = true
        forthTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive  = true
        forthTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14).isActive  = true
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-350-[v1]-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1":favoritePlacesCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":favoritePlacesCollectionView]))
    }
}

