//
//  Constants.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/8/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

// Urls
struct URLs {
     
     static let base = "http://ide-hospital.ideaeg.co/api"
     static let about_us = "about_us"
     static let login = "/login"
     static let main_Categories = "/main_categories"
     static let category = "/main_categories"
     static let doctorQuary = "/doctors_query_parameters"
     static let favoritesDoctors = "/favorites/doctors"
     static let addOrDeleteDoctors = "/add_remove"
     static let userAppointments = "/user_appointments"
     static let doctors = "/doctors"
     static let nursing_requests = "/nursing_requests"


}
// UserDefaultsKeys
struct UserDefaultsKeys {
     static let token = "UDKToken"
     static let serviceID = "id"
     static let doctorID = "id"
     static let infoLocData = "infoLocData"
}
// label text
struct LabelText {
    static let homeLabel = "IDEA EG HOSPITAL THE BEST CHOICE"
    static let humanMedicineLabel = "Human Medicine"
    static let mRILabel = "MRI"
    static let hOMENURSELabel = "HOME NURSE"
    static let veterinaryLabel = "Veterinary"
    static let noDataFoundLabel = "No Data Found"
    static let ideaHospital = "IDEA EG HOSPITAL"
}

// Parameters Keys
struct ParameterKeys {
     static let email = "email"
     static let password = "password"
     static let name = "name"
     static let mobile = "mobile"
     static let message = "message"
     static let specialtyId = "specialty_id"
     static let cityId = "city_id"
     static let regionId = "region_id"
     static let companyId = "ompany_id"
}

// Header Keys
struct HeaderKeys {
     static let contentType = "Content-Type"
     static let authorization = "Authorization"
     static let accept = "accept"
     static let acceptLanguage = "Accept-Language"
     static let categoryToken = "X-CSRF-TOKEN"
}

// Header Values
struct HeaderValues {
     static let applicationJson = "application/json"
     static let contentType = "application/x-www-form-urlencoded"
     static let brearerToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNzgxNWYyNmYwYmMxZDUzOGUxOGZjMzY5OTUyMDE0NGVjOGRhNWVkNTI4OGE4ZTcxYjk2YjA0NjVkZGRiMzhjNzZkMDhjMjhiYjM3NTgwZmQiLCJpYXQiOjE2MDc4MDU4MzIsIm5iZiI6MTYwNzgwNTgzMiwiZXhwIjoxNjM5MzQxODMyLCJzdWIiOiI0MyIsInNjb3BlcyI6W119.R9VqcAnV6dPGNLk2eA9E9M6TaZb_57-VmDM4X3ZhSoAiCehOvrtdDa25MICx59b-BHXiGdJTzcRfEgThbcCJLhzaEX0-nnhMZNugCjmhnD9Kee4SDsDEC5B8G6jpKqQYXak4TwrCR22_lN70t-F9X9qEzsNvu7yLTfHrTHAl5jkWx9jibt23TyuabUcre9SMtcOBCtHj7aw-YCd5nAO-lZ0Q59cP1DkrTUtfx9Cg2kco0IcD-E5HZ4gCdz680G1NsCSZtTmLRaNCgvtQryfT6ij_mIJr9BpFRGeXdiSii4NBIpw5tV1dUUJZm7N5TQp_cUXLAy43lHeUDdJgwOPLdKZLqkOe2txj-pS042XgXQuBKkFFzP7yEtunkuMMQkDXz71ES0WfX1-U-a3rnoeIFj0laFWDTYjq_ZntLIHHtFVVKOvTrT09CInWjEunDuBaM2EJX6PiCVOJ9pKAYfwK1GGQGXElEzO7CfTk2q4SCrz6xHFhB3_j5qG5mysXTlvQgKAbIzKSRP1nKTAU_lHrpJVmRUdnOPBx2zvzN0JISjj681B2KinUVmG05hwBWlmI-kykE0zd0-XUPuSHbun4M0eYZ_2SRJAT2DlAVSzqLubWwWSOK5-IHg6uZRBHtgfFU2f6-5F5LcXJ3gON8-lgTJ-ZdPRz_ORYXZOzgup-zKs"
     static let accept = "application/json"
     static let acceptLanguage = "en"
     static var categoryToken = "76A7SdHtnY2ft6RBeZ4pYDkhxaNNeRFURm4tIJVP"
     static let doctorCategoryToken = "XgUkAqEPQwNCm1JXKtvlXk6BlywPtPpqLb7UdAJl"
}
// Storyboards
struct Storyboards {
     static let main = "Main"
     static let mainTabBar = "MainTabBar"
     static let search = "Search"
    
}
// View Controllers
struct ViewControllers {
     static let homeVC = "HomeVC"
     static let searchVC = "SearchVC"
     static let appointmentVC = "AppointmentVC"
     static let mainTabBarController = "MainTabBarController"
     static let searchResultVC1 = "SearchResultVC1"
     static let myFavoritesVC = "MyFavoritesVC"
     static let searchViewController = "SearchViewController"
     static let doctoreVC = "DoctoreVC"
     static let viewLocationInMapVC = "ViewLocationInMapVC"
     static let homeNurseVC = "HomeNurseVC"
     static let searchResultVC = "SearchResultVC"
}
// Cells
struct Cells {
     static let favoritesResultTViewCell = "FavoritesAppointmentsTViewCell"
     static let appointmentsTViewCell = "AppointmentsTViewCell"
     static let appointmentsCell = "AppointmentsCell"
     static let doctorCell = "DoctorCell"

}

//Title Alert Action
struct AlertActionTitle {
     static let no = "No"
     static let yes = "Yes"
     static let name = "Name"
          static let email = "Email"
     static let password = "Password"
     static let age = "Age"
     static let cancel = "Cancel"
     static let camera = "Camera"
     static let photoAlbum = "Photo Album"
     static let success = "Success"
}
//Title Message
struct TitleMsg {
     static let invalidName = "Invalid Name"
     static let invalidEmail = "Invalid Email"
     static let invalidPassword = "Invalid Password"
     static let invalidAge = "Invalid Age"
     static let invalid = "Invalid"
     static let profileEditting = "Profile Editting"
     static let edittingSelection = "Editting Selection"
     static let confirm = "Confirm"
     static let imageSelection = "Image Selection"
}

// Messege content
struct Messages {
     static let  emailAndPassErrorMsg = "Please Enter Valid Email and Password"
     static let nameErrorMsg = "Enter Valid name ..at least consists two letters and first & last name"
     static let passwordErrorMsg = "Password Must be at Least 8 Characters"
     static let ageErrorMsg = "Enter valid age .. greater than or equal 10 years"
     static let emailErrorMsg = "Please Enter Valid Email"
     static let invalidErrorMsg = "Please Enter your Valid data"
     static let deleteItemSuccessMsg = "Delete the task Successfully"
     static let dateErrorMsg = "Enter the date , please .."
     static let ItemErrorMsg = "Enter your item details.."
     static let itemSavedSuccessMsg = "Done saved the task successfully"
     static let edittingDoneSuccessMsg = "Editting Done Successfully.."
     static let edittingMsg = "Are you sure , Do you want to edit your profile?"
     static let deleteItemMsg = "Are you sure you want to Delete the item ?"
     static let editSelection = "please...press what do you whant to edit it?"
     static let enterYourNew = "Enter your new"
     static let confirmLogout = "Are you sure Do you want log out?"
     static let howToPickedImageMsg = "From where you want to pick this image?"
     static let tryAgainWithCorrect =   "please...try again with correct"
     
     }
