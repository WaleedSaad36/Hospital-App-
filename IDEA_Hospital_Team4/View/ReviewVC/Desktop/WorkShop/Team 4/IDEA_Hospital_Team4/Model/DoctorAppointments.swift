//
//  DoctorAppointments.swift
//  IDEA_Hospital_Team4
//
//  Created by Waleed on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct DoctorAppointment: Codable {
    let id: Int
    let apointment: String //($date)
    let bookForAnother: Bool
    let username: String
    let doctor: [Doctor]
    
    enum CodingKeys: String, CodingKey {
        case id, apointment, username, doctor
        case bookForAnother = "book_for_another"
    }
}
