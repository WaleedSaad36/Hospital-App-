//
//  APIRouter.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    
    case getMainCategories
    case getSearchCategoryData(_ id: Int)
    case nurseRequest(_ requestBody: RequestDataNurse)
    case getDoctors(data: DoctorsQuery, sortBy: String?, page: Int)
    case addAndRemoveFavorite(id: Int)
    case register(data:SignUpData)
    case forgetPassword(email : String)
    case login(email : String, password:String)
    case reviewDoctors(id: Int, rating: Int, comment: String)
    case getDoctorData(_ doctorId: Int)
    case bookAppointmentWithDoctor(_ voucher: String,_ name: String, _ bookForAnother: Bool, _ id: Int, _ appointment: String)
    case registerNewUsersFromPopUp(body: bodyPopupAuth)
    case loginAndBookFromPopUp(body: BodyLoginPopUp)
    
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self{
        case .getSearchCategoryData, .getMainCategories, .getDoctors, .getDoctorData:
            return .get
        default:
            return .post
        }
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getDoctors(let data, let sortBy, let page):
        return [ParameterKeys.specialtyID: data.specialtiesID ?? "",
                ParameterKeys.cityID: data.cityID ?? "",
                ParameterKeys.regionID: data.regionID ?? "",
                ParameterKeys.companyID: data.compayID ?? "",
                ParameterKeys.orderBy: sortBy ?? "fees",
                ParameterKeys.paginationPageNumber: page,
                ParameterKeys.name: data.doctorName ?? "" ]
        case .forgetPassword(let email):
            return [ParameterKeys.email : email]
        case .login(let email, let password):
            return [ParameterKeys.email: email, ParameterKeys.password:password]
        case .reviewDoctors(let id, let rating, let comment):
            return [ParameterKeys.doctor_id: id, ParameterKeys.rating: rating, ParameterKeys.comment:comment ]
            
        case .bookAppointmentWithDoctor(let voucher, let name, let bookForAnother, let id , let appointment):
            if voucher.isEmpty || voucher == ""{
                return [ParameterKeys.appointment : appointment , ParameterKeys.bookforanother: bookForAnother, ParameterKeys.patientName: name, ParameterKeys.id: id]
            }else{
                return [ParameterKeys.voucher:voucher, ParameterKeys.appointment: appointment , ParameterKeys.bookforanother: bookForAnother, ParameterKeys.patientName: name, ParameterKeys.id: id]
            }
        default:
            return nil
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getSearchCategoryData(let id):
            return URLs.mainCategories + "/\(id)" + URLs.doctorsQueryParameters
        case .getMainCategories:
            return URLs.mainCategories
        case .nurseRequest:
            return URLs.requestNurse
        case .getDoctors(let data,_,_):
            return URLs.mainCategories + "/" + "\(data.mainID ?? 1)" + URLs.doctors
        case .addAndRemoveFavorite(let id):
            return URLs.favorites + "/\(id)" + URLs.addRemove
    //Auth URLs Path
        case .register:
            return URLs.register
        case .forgetPassword:
            return URLs.resetPassword
        case .login:
            return URLs.login
        case .reviewDoctors(let id, _, _) :
                return "/doctors" + "/\(id)" + "/reviews"
        case .getDoctorData(let doctorId):
            return URLs.doctors + "/\(doctorId)"
        case .bookAppointmentWithDoctor(_, _, _, _, _):
            return URLs.userAppointment
        case .registerNewUsersFromPopUp(let body):
            return URLs.registerNewUsersPopUP
        case .loginAndBookFromPopUp(let body):
            return URLs.LoginUserPopUp
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
    //httpMethod
        urlRequest.httpMethod = method.rawValue
        switch self {
            
        default:
            urlRequest.setValue("en", forHTTPHeaderField: HeaderKeys.acceptLanguage)
        }
        let token = UserDefaultsManager.shared().token
        urlRequest.setValue(HeaderKeys.tokenTest , forHTTPHeaderField: HeaderKeys.authorization)
        urlRequest.setValue("en", forHTTPHeaderField: HeaderKeys.acceptLanguage)
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.contentType)
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.accept)
        
    // HTTP Body
        let httpBody: Data? = {
            switch self {
                case .nurseRequest(let body):
                    return encodeToJSON(body)
                case .register(let body):
                    return encodeToJSON(body)
                case .registerNewUsersFromPopUp(let body):
                    return encodeToJSON(body)
                case .loginAndBookFromPopUp(let body):
                    return encodeToJSON(body)
                
            default:
                return nil
            }
        }()
        urlRequest.httpBody = httpBody
        
    // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
}

extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}

// type-erasing wrapper
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void
    
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}

