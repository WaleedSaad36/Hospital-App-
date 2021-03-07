//
//  BookingData.swift
//  IDE Hospital
//
//  Created by Ibrahim El-geddawy on 10/19/20.
//

import Foundation

// MARK: - Booking Data
struct BookingData: Codable{
    
    var doctorID: Int? = -1
    var appointment: Double? = 0
    var username: String? = ""
    var bookForAnother: Int = 0
    var voucher: String? = ""
    var patientName: String? = ""
    
    init(doctorID: Int, appointment: Double) {
        self.doctorID = doctorID
        self.appointment = appointment
    }
    init(doctorID: Int, appointment: Double, voucher: String) {
        self.doctorID = doctorID
        self.appointment = appointment
        self.voucher = voucher
    }
    init(doctorID: Int, appointment: Double, bookForAnother: Int, patientName: String) {
        self.doctorID = doctorID
        self.appointment = appointment
        self.bookForAnother = bookForAnother
        self.patientName = patientName
    }
    init(doctorID: Int, appointment: Double, bookForAnother: Int, patientName: String, voucher: String) {
        self.doctorID = doctorID
        self.appointment = appointment
        self.bookForAnother = bookForAnother
        self.patientName = patientName
        self.voucher = voucher
    }
   
    enum CodingKeys: String, CodingKey {
        case appointment, username, voucher
        case doctorID = "doctor_id"
        case bookForAnother = "book_for_another"
        case patientName = "patient_name"
    }
}
