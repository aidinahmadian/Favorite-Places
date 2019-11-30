//
//  PlacesAPI.swift
//  Favorite Places
//
//  Created by aidin ahmadian on 10/24/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import Foundation

class PlacesAPI {
    static func getLists() -> [Places]{
        let PlacesLists = [
            Places(imageName: "firstpic", placeName: "Empire State", placeAddress: "New York City", rateTag: "Rate: 6.5"),
            Places(imageName: "secondpic", placeName: "Manhattan", placeAddress: "New York City", rateTag: "Rate: 5.0"),
            Places(imageName: "thirdpic", placeName: "45th Street", placeAddress: "New York City", rateTag: "Rate: 7.7"),
            Places(imageName: "forthpic", placeName: "50th Street", placeAddress: "New York City", rateTag: "Rate: 4.2"),
        ]
        return PlacesLists
    }
}
