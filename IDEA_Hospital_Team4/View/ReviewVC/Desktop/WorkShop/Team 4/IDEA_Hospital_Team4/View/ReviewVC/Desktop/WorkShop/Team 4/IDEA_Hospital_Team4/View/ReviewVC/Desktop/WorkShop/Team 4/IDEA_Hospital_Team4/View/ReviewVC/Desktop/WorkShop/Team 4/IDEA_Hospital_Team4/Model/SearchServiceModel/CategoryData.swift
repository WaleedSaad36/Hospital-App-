//
//  CategoryData.swift
//  IDEA_Hospital_Team4
//
//  Created by Waleed on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct CategoryDataResponse: Codable{
    var data: categoryDataResponse?
    var code: Int?
}

struct categoryDataResponse: Codable{
    let specialties: [Company]
    let cities: [City]
    let companies: [Company]
}
