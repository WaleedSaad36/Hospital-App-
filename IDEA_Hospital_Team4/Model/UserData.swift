//
//  UserData.swift
//  IDE Hospital
//
//  Created by Elshaer on 10/19/20.
//

import Foundation

// MARK: - UserData
struct UserDataModel: Codable {
    
    var name: String? = ""
    var email: String = ""
    var mobile: String? = ""
    var password: String? = ""
    var oldPassword: String? = ""
    var doctorID: Int? = -1
    var appointment: String? = ""
    var patientName: String? = ""
    var voucher: String? = ""
    var isbookForAnother: Int? = -1
    
    init(name: String, email: String, mobile: String) {
        self.name = name
        self.email = email
        self.mobile = mobile
    }
    init(name: String, email: String, mobile: String, password: String, oldPassword: String) {
        self.name = name
        self.email = email
        self.mobile = mobile
        self.password = password
        self.oldPassword = oldPassword
    }
        
    enum CodingKeys: String, CodingKey {
        case name, email, mobile, password, appointment, voucher
        case oldPassword = "old_password"
        case doctorID = "doctor_id"
        case patientName = "patient_name"
        case isbookForAnother = "book_for_another"
    }
}
