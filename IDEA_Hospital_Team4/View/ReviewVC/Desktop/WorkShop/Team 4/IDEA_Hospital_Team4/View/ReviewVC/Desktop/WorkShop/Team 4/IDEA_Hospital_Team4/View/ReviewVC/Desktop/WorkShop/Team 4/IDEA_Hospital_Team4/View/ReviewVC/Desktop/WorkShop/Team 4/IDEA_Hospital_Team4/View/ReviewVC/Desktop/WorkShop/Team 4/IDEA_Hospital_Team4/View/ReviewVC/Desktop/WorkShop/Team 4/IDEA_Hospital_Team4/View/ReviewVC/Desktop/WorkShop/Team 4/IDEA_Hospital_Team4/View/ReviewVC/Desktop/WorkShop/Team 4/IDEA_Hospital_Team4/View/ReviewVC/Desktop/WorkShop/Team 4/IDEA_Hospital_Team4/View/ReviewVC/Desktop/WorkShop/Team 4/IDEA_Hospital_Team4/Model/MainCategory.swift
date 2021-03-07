//
//  MainCategory.swift
//  IDEA_Hospital_Team4
//
//  Created by Waleed on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation


struct MainCategoryResponse: Codable {
    let data: [MainCategory]
    let code: Int
}

struct MainCategory: Codable {
    let id: Int
    let name: String
    let image: String
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, color
    }
}
