//
//  DoctorResultResponse.swift
//  IDEA_Hospital_Team4
//
//  Created by Mohamed Elshaer on 1/23/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation

// MARK: - DoctorDataArray
struct DoctorDataArray: Decodable {
    let items: [Doctor]?
    let total: Int
    let page: Int
    let per_page: Int
    let total_pages: Int
}

// MARK: - FavResponse Response
struct FavResponse: Decodable {
    let success: Bool?
    let code: Int?
    let data: DoctorDataArray?
    let message: String?
}
