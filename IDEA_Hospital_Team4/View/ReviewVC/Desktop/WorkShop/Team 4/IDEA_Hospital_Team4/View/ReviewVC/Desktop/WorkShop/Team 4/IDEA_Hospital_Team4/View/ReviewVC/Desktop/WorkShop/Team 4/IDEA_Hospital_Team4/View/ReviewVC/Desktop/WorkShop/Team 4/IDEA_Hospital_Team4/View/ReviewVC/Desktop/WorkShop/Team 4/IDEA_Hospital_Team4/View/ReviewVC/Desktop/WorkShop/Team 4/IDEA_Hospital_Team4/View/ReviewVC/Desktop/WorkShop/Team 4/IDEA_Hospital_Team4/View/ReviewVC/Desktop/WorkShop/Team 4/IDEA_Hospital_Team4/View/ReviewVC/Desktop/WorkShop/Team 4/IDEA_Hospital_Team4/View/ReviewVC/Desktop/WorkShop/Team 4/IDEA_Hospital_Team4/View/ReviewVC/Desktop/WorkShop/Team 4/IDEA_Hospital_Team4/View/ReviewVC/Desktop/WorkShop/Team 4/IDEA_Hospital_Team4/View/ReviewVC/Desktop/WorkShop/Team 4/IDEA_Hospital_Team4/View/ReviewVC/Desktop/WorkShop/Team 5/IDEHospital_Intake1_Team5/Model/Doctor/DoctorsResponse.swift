//
//  DoctorsResponse.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/19/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation

// MARK: - Doctor Response
struct DoctorResponse: Codable {
    let data: DoctorData1
    let code: Int
    let success: Bool
}

// MARK: - DataClass
struct DoctorData1: Codable {
    let items: [DoctoreItem]
    let total, page, perPage, totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case items, total, page
        case perPage = "per_page"
        case totalPages = "total_pages"
    }
}

// MARK: - Item
struct DoctoreItem: Codable {
    let id, rating, reviewsCount: Int
    let specialty: String
    let name, bio: String
    let secondBio: String
    let address: String
    let lng, lat: Double
    let fees, waitingTime: Int
    let image: String
    let city: String
    let region: String
    let companies: [String]
    let isFavorited: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, rating
        case reviewsCount = "reviews_count"
        case specialty, name, bio
        case secondBio = "second_bio"
        case address, lng, lat, fees
        case waitingTime = "waiting_time"
        case image, city, region, companies
        case isFavorited = "is_favorited"
    }
}

enum Address: String, Codable {
    case andalusiaSmouhaHospital = "Andalusia Smouha Hospital"
}

