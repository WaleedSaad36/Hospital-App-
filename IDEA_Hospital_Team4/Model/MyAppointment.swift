//
//  MyAppointment
//
//  Created by Ibrahim El-geddawy on 10/19/20
//  Copyright (c) . All rights reserved.
//

import Foundation

// MARK: - DataArray
struct DataArray: Decodable {
    let items: [MyAppointment]?
    let total: Int
    let page: Int
    let per_page: Int
    let total_pages: Int
}

// MARK: - MyAppointment Response
struct MyAppointmentResponse: Decodable {
    let success: Bool?
    let code: Int?
    let data: DataArray?
    let message: String?
}

// MARK: - MyAppointment
struct MyAppointment: Codable {
    
    var doctor: Doctor?
    var bookForAnother: Bool?
    var id: Int?
    var patientName: String?
    var appointment: Double?
    
    enum CodingKeys: String, CodingKey {
        case doctor, id, appointment
        case bookForAnother = "book_for_another"
        case patientName = "patient_name"
    }
}

struct deleteAppointment: Codable{
    var success: Bool
}
