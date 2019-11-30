//
//  Extensions.swift
//  Favorite Places
//
//  Created by aidin ahmadian on 10/24/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import UIKit

// MARK: HomeViewController Extension


extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoritePlacesCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoritePlacesCollectionView
        //cell.backgroundColor = .black
        cell.PlaceArtwork = placeLists[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: favoritePlacesCollectionView.frame.width - 60, height: favoritePlacesCollectionView.frame.height - 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moreInfoViewController = StretchyHeaderController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(moreInfoViewController, animated: true)
    }
}
