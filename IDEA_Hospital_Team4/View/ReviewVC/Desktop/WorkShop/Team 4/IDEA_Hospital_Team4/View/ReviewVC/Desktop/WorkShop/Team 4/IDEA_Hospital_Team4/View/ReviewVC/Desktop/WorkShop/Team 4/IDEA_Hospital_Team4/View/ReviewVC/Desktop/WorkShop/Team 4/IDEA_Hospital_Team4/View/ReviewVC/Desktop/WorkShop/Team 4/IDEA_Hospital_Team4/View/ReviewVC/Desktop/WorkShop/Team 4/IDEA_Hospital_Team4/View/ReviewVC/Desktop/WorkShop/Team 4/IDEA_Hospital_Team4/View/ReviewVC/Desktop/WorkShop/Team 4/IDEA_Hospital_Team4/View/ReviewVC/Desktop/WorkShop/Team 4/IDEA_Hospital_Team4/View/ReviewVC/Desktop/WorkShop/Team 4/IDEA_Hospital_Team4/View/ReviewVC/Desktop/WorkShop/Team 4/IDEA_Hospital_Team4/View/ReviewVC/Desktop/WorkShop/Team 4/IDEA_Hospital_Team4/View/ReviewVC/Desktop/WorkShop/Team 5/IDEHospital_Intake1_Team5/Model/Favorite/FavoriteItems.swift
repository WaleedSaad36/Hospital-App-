//
//  FavoriteItems.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct FavoriteItems : Codable {
    let id : Int
    let rating : Int
    let reviewsCount : Int
    let specialty : String
    let name : String
    let bio : String
    let secondBio : String
    let address : String
    let lng : Double
    let lat : Double
    let fees : Int
    let waitingTime : Int
    let image : String
    let city : String
    let region : String
    let companies : [String]
    let isFavorited : Bool

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case rating = "rating"
        case reviewsCount = "reviews_count"
        case specialty = "specialty"
        case name = "name"
        case bio = "bio"
        case secondBio = "second_bio"
        case address = "address"
        case lng = "lng"
        case lat = "lat"
        case fees = "fees"
        case waitingTime = "waiting_time"
        case image = "image"
        case city = "city"
        case region = "region"
        case companies = "companies"
        case isFavorited = "is_favorited"
    }
}
