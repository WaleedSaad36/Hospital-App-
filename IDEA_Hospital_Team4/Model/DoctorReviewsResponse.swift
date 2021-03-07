//
//  DoctorReviewsResponse.swift
//  IDEA_Hospital_Team4
//
//  Created by Mohamed Elshaer on 1/23/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation

// MARK: - DataArray
struct DoctorReviewsDataArray: Decodable {
    let items: [ReviewModel]?
    let total: Int
    let page: Int
    let per_page: Int
    let total_pages: Int
}

// MARK: - MyAppointment Response
struct DoctorReviewsResponse: Decodable {
    let success: Bool?
    let code: Int?
    let data: DoctorReviewsDataArray?
    let message: String?
}
