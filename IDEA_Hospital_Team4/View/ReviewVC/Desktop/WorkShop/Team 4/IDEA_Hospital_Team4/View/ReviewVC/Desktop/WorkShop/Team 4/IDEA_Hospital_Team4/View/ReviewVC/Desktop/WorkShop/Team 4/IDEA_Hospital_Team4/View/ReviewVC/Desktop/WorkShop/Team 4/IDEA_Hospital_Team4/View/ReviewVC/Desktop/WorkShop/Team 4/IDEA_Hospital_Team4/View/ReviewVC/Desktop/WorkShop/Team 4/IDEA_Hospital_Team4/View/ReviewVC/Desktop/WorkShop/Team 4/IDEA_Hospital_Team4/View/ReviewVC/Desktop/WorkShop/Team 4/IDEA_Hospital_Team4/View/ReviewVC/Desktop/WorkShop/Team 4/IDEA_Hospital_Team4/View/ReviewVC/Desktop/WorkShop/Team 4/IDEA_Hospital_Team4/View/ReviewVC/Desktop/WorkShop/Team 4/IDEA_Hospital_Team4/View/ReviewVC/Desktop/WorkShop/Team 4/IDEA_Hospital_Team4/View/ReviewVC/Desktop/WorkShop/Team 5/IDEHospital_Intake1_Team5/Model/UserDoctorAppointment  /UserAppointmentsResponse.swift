//
//  UserAppointmentsResponse.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct UserAppointmentsResponse : Codable {
    let data : UserDoctorAppointmentData
    let code : Int
    let success : Bool

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case code = "code"
        case success = "success"
    }

}
