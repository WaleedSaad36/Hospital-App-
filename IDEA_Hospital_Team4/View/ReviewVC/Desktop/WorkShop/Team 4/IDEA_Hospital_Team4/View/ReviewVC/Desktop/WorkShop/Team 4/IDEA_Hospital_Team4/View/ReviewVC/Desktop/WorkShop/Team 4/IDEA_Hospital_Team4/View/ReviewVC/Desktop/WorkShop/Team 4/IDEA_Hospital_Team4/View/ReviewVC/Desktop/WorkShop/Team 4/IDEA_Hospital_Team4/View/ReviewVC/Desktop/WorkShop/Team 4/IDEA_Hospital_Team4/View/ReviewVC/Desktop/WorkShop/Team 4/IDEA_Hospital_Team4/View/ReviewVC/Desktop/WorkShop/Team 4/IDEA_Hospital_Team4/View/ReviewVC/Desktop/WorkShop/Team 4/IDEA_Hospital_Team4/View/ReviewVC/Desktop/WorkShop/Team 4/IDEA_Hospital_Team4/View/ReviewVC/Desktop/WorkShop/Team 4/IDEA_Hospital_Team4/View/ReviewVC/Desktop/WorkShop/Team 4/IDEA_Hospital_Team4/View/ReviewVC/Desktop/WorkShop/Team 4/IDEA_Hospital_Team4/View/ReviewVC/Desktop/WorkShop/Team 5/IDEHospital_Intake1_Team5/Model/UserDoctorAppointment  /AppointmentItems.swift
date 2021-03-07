//
//  ItemsData.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct AppointmentItems : Codable {
    let id : Int
    let appointment : Int
    let patientName : String
    let bookForAnother : Bool
    let doctor : DoctorData
    let voucher : Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case appointment = "appointment"
        case patientName = "patient_name"
        case bookForAnother = "book_for_another"
        case doctor = "doctor"
        case voucher = "voucher"
    }
}
