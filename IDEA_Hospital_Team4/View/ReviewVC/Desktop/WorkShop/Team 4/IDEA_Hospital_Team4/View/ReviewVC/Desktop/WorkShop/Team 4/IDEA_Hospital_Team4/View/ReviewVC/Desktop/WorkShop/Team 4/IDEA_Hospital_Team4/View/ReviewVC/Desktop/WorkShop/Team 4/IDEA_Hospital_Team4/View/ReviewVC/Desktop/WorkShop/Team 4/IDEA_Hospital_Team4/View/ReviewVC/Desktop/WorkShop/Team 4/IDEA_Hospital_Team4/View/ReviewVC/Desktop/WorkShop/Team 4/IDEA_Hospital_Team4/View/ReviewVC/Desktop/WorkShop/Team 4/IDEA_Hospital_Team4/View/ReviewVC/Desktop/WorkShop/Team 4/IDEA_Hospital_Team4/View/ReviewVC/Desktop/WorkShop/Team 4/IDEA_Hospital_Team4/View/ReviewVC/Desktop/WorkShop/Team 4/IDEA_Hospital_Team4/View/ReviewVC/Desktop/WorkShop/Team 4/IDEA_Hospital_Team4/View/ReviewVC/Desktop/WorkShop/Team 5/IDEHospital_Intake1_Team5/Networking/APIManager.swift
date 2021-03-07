//
//  APIManager.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/7/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    //MARK:- Login
    class func  login(email: String, password: String, completion: @escaping (Result<LoginResponse , Error>) -> ()){
        request(APIRouter.login(email, password)){ (response) in
            completion(response)
        }
    }
    //MARK:- Main Categories
    class func  main_Categories(completion: @escaping (Result< MainCategoriesResponse , Error>) -> ()){
        request(APIRouter.main_Categories){ (response) in
            completion(response)
        }
    }
    
    //MARK:- Get User Favorites
    class func  favoritesDoctors(completion: @escaping (Result< UserFavoriteDoctorsResponse , Error>) -> ()){
        request(APIRouter.favoritesDoctors){ (response) in
            completion(response)
        }
    }
    //MARK:- Add or delete doctors from user doctors favorite list
    class func  addDeleteDoctor(_ id: String , completion: @escaping (Result< AddDeleteDoctoreFromFavoriteResponse , Error>) -> ()){
        request(APIRouter.addDeleteDoctor(id)){ (response) in
            completion(response)
        }
    }
    //MARK:-delete appointment with doctor
    class func  deleteUserAppointment(_ id: String , completion: @escaping (Result< DeleteAppointmentWithDoctorResponse , Error>) -> ()){
        request(APIRouter.deleteUserAppointment(id)){ (response) in
            completion(response)
        }
    }
    //MARK:- Get User Appointments
    class func  userAppointments(completion: @escaping (Result< UserAppointmentsResponse , Error>) -> ()){
        request(APIRouter.userAppointments){ (response) in
            completion(response)
        }
    }
    //MARK:- Categories
    class func getCategories(_ id: String , completion: @escaping (Result< DoctorsQueryCategoryResponse, Error>) -> ()){
        request(APIRouter.categories(id)){ (response) in
            completion(response)
        }
    }
    //MARK:- Doctors
    class func getDoctors(id: String,specialtyId: String,cityId: String,regionId: String,companyId: String, doctorName: String, completion: @escaping (Result<DoctorResponse, Error>) -> ()){
        request(APIRouter.doctors(id , specialtyId , cityId, regionId, companyId, doctorName)) { (response) in
            completion(response)
        }
    }
    //MARK:- Nurse Request
    class func nurseRequest(body : RequestBodyData, completion: @escaping (Result<NurseRequestResponse, Error>) -> ()){
        request(APIRouter.nursingRequests(body)) { (response) in
            completion(response)
        }
    }
}
    // MARK:- The request function to get results in a closure
extension APIManager{
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        .responseJSON { response in
            print(response)
        }
    }
}
