//
//  CategoryResponse.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/14/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation

// MARK: - CategoryResponse
struct DoctorsQueryCategoryResponse: Codable {
    let success: Bool
    let code: Int
    let data: DoctorsQueryCategoryData
}

// MARK: - DataClass
struct DoctorsQueryCategoryData: Codable {
    let specialties: [Specialties]
    let cities: [Cities]
    let companies: [Companies]
}
// MARK: - Specialties
struct Specialties: Codable {
    let id: Int
    let name: String
}

// MARK: - City
struct Cities: Codable {
    let id: Int
    let name: String
    let regions: [Regions]
}
// MARK: - Regions
struct Regions: Codable {
    let id: Int
    let name: String
}

// MARK: - Company
struct Companies: Codable {
    let id: Int
    let name: String
}


