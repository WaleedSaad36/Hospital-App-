//
//  Constants.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

// Storyboards
struct Storyboards {
    static let main = "Main"
    static let mainHome = "MainHome"
    static let homeNurse = "HomeNurse"
    static let searchResult = "SearchResult"
    static let auth = "Auth"
    static let review = "ReviewDoctor"
    static let test = "Test"
    static let settings = "Settings"
    static let drProfile = "DrProfile"
    static let favorite = "Favorite"
}

// Urls
struct URLs {
    static let base = "http://ide-hospital.ideaeg.co/api"
    //auth
    static let login = "/login"
    static let logout = "/logout"
    static let register = "/register"
    static let resetPassword = "/forget_password"
    static let user = "/user"
    //static content
    static let aboutus = "/about_us"
    static let terms = "/terms_and_conditions"
    //dr profile
    static let appointments = "/appointments"
    static let reviews = "/reviews"
    static let userAppointment = "/user_appointments"
    static let userAppointmentWithLogin = "/with_login"
    static let userAppointmentWithRegister = "/with_register"
    // main
    static let mainCategories = "/main_categories"
    // Fav
    static let favorites = "/favorites/doctors"
    static let addRemove = "/add_remove"
    static let doctors = "/doctors"
    static let doctorsQueryParameters = "/doctors_query_parameters"
    static let contactus = "/contact_us_requests"
    static let requestNurse = "/nursing_requests"
    static let registerNewUsersPopUP = "/user_appointments/with_register"
    static let LoginUserPopUp = "/user_appointments/with_login"
    
}

// Header Keys
struct HeaderKeys {
    static let contentType = "Content-Type"
    static let accept = "accept"
    //static let token = "X-CSRF-TOKEN"
    static let acceptLanguage = "Accept-Language"
    static let authorization  = "Authorization"
    static let tokenTest = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNzgxNWYyNmYwYmMxZDUzOGUxOGZjMzY5OTUyMDE0NGVjOGRhNWVkNTI4OGE4ZTcxYjk2YjA0NjVkZGRiMzhjNzZkMDhjMjhiYjM3NTgwZmQiLCJpYXQiOjE2MDc4MDU4MzIsIm5iZiI6MTYwNzgwNTgzMiwiZXhwIjoxNjM5MzQxODMyLCJzdWIiOiI0MyIsInNjb3BlcyI6W119.R9VqcAnV6dPGNLk2eA9E9M6TaZb_57-VmDM4X3ZhSoAiCehOvrtdDa25MICx59b-BHXiGdJTzcRfEgThbcCJLhzaEX0-nnhMZNugCjmhnD9Kee4SDsDEC5B8G6jpKqQYXak4TwrCR22_lN70t-F9X9qEzsNvu7yLTfHrTHAl5jkWx9jibt23TyuabUcre9SMtcOBCtHj7aw-YCd5nAO-lZ0Q59cP1DkrTUtfx9Cg2kco0IcD-E5HZ4gCdz680G1NsCSZtTmLRaNCgvtQryfT6ij_mIJr9BpFRGeXdiSii4NBIpw5tV1dUUJZm7N5TQp_cUXLAy43lHeUDdJgwOPLdKZLqkOe2txj-pS042XgXQuBKkFFzP7yEtunkuMMQkDXz71ES0WfX1-U-a3rnoeIFj0laFWDTYjq_ZntLIHHtFVVKOvTrT09CInWjEunDuBaM2EJX6PiCVOJ9pKAYfwK1GGQGXElEzO7CfTk2q4SCrz6xHFhB3_j5qG5mysXTlvQgKAbIzKSRP1nKTAU_lHrpJVmRUdnOPBx2zvzN0JISjj681B2KinUVmG05hwBWlmI-kykE0zd0-XUPuSHbun4M0eYZ_2SRJAT2DlAVSzqLubWwWSOK5-IHg6uZRBHtgfFU2f6-5F5LcXJ3gON8-lgTJ-ZdPRz_ORYXZOzgup-zKs"
}

// Parameters Key
struct ParameterKeys {
    static let username = "username"
    static let password = "password"
    static let doctor_id = "doctor_id"
    static let doctorID = "doctor_id"
    static let specialtyID = "specialty_id"
    static let cityID = "city_id"
    static let regionID = "region_id"
    static let companyID = "company_id"
    static let name = "name"
    static let orderBy = "order_by"
    static let comment = "comment"
    static let rating = "rating"
    static let paginationPageNumber = "page"
    static let PaginationPerPage = "per_page"
    static let userAppointmentID = "user_appointment_id"
    static let latitude = "latitude"
    static let longitude = "longitude"
    static let email = "email"
    // Doctor Appoinment
    static let id = "doctor_id"
    static let appointment = "appointment"
    static let voucher = "voucher"
    static let bookforanother = "book_for_another"
    static let patientName = "patient_name"
}

// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "AccessToken"
    static let isLoggedIn = "IsLoggedIn"
    static let categoryId = "CategoryId"
}

struct viewControllers {
    static let searchVC = "SearchVC"
    static let favoriteVC = "FavoriteVC"
    static let scheduleVC = "ScheduleVC"
    static let searchResultVC = "SearchResultVC"
    static let tabBar = "TabBar"
    static let mainHomeVC = "MainHomeVC"
    static let homeNurseVC = "HomeNurseVC"
    static let signUpVC = "SignUpVC"
    static let resetPasswordVC = "ResetPasswordVC"
    static let loginVC = "LoginVC"
    static let reviewVC = "ReviewVC"
    static let voucharVC = "VoucharPopVC"
    static let testVC = "TestVC"
}

// Custom Cells
struct CustomCells {
    static let mainCell = "MainCell"
    static let searchResultCell = "SearchResultCell"
    static let favoriteCell = "FavoriteCell"
}
