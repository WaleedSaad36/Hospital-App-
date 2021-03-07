//
//  DoctorAppointmentResponse.swift
//  IDEA_Hospital_Team4
//
//  Created by Mohamed Elshaer on 1/23/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation

// MARK: - FavResponse Response
struct DoctorAppointmentResponse: Decodable {
    let success: Bool?
    let code: Int?
    let data: [AppointmentDate]?
    let message: String?
}
