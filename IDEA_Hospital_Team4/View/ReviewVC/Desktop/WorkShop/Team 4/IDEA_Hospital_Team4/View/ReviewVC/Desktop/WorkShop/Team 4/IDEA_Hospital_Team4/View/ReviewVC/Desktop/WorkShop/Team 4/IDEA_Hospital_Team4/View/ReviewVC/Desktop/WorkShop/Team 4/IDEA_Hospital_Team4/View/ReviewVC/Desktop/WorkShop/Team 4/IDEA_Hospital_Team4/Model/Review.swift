//
//  Review.swift
//  IDEA_Hospital_Team4
//
//  Created by Waleed on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct Review: Codable {
    
    let id: Int
    let rating: Int
    let comment: String
    let commentedBy: String
    
    enum CodingKeys: String, CodingKey {
        case id, rating, comment
        case commentedBy = "commented_by"
    }
}
struct ReviewResponse: Codable{
    let message: String?
    let code: Int?
    let success: Bool?
}
