//
//  Register
//  IDE Hospital
//
//  Created by Elshaer on 10/19/20.
//

import Foundation

// MARK: - Main Response
struct RegisterResponse: Decodable {
    let success: Bool?
    let code: Int?
    let data: Register?
    let message: String?
}

// MARK: - Register
struct Register: Codable {
    
    let id: Int
    let name, email, mobile: String
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, mobile
        case accessToken = "access_token"
    }
}
