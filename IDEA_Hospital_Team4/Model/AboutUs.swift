//
//  AboutUs.swift
//  IDEA_Hospital_Team4
//
//  Created by Mohamed Elshaer on 1/23/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation

// MARK: - AboutUsResponse
struct AboutUsResponse: Decodable {
    let success: Bool?
    let code: Int?
    let data: AboutUs?
    let message: String?
}

// MARK:- About Us
struct AboutUs: Codable{
    
    var aboutUs: String?
    
    enum CodingKeys: String, CodingKey {
        case aboutUs = "about_us"
    }
}


// MARK: - TermsAndConditionsResponse
struct TermsAndConditionsResponse: Decodable {
    let success: Bool?
    let code: Int?
    let data: TermsAndConditions?
    let message: String?
}

// MARK:- Terms And Conditions
struct TermsAndConditions: Codable{
    
    var termsAndConditions: String?
    
    enum CodingKeys: String, CodingKey {
        case termsAndConditions = "terms_and_conditions"
    }
}
