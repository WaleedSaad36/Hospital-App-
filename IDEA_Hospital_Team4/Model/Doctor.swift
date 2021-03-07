//
//  Doctor.swift
//  IDEA_Hospital_Team4
//
//  Created by Waleed on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct Doctor: Codable {
    
    let id: Int?
    let rating: Int?
    let reviewsCount: Int?
    let name: String?
    let bio: String?
    let secondBio: String?
    let specialty: String?
    let address: String?
    let lng: Float?
    let lat: Float?
    let fees: Int?
    let waitingTime: Int?
    let image: String?
    let city: String?
    let region: String?
    var isFavorited: Bool?
    let companies: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, rating, name, bio, specialty, address, lng, lat, fees, image, city, region, companies
        case reviewsCount = "reviews_count"
        case secondBio = "second_bio"
        case waitingTime = "waiting_time"
        case isFavorited = "is_favorited"
    }
}
