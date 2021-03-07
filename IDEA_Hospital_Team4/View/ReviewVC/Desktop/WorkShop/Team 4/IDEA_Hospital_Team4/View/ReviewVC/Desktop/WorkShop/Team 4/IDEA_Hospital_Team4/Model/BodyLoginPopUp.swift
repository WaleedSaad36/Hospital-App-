//
//  BodyLoginPopUp.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/22/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation
struct BodyLoginPopUp:Codable{
    let email: String?
    let password: String?
    let doctorId: Int?
    let appointment: String?
    let voucher: String?
    let patientName: String?
    let bookForAnother: Bool?
    
    enum CodingKeys: String, CodingKey {
        case email, password, appointment, voucher
        case doctorId = "doctor_id"
        case patientName = "patient_name"
        case bookForAnother = "book_for_another"
    }
}
