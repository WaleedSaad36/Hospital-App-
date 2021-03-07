//
//  DeleteAppointmentWithDoctorResponse.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct DeleteAppointmentWithDoctorResponse : Codable {
    let success : Bool
    let code : Int
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case code = "code"
    }
}
