//
//  Voucher.swift
//  IDEA_Hospital_Team4
//
//  Created by Waleed on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct Voucher: Codable {
    let id: Int
    let code: Int
    let discountPercent: Float
    let expiredAt: Int
    
    enum CodingKeys: String, CodingKey {
        case id, code
        case discountPercent = "discount_percent"
        case expiredAt = "expired_at"
    }
    
}
