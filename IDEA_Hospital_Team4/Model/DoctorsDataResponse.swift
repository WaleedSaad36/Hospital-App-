//
//  DoctorsDataResponse.swift
//  IDEA Hospital
//
//  Created by yasser on 12/24/20.
//  Copyright © 2020 Yasser Aboibrahim. All rights reserved.
//

import Foundation

struct DoctorDataResponse: Codable{
    var data: Doctor?
    var code: Int
}

struct DoctorListReponse: Codable {
    let items: [Doctor]?
    let total: Int
    let page: Int
    let per_page: Int
    let total_pages: Int
}

struct DoctorList: Codable{
    var data: DoctorListReponse?
    var code: Int
}
