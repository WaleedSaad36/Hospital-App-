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
    case doctorDetails(id: Int)
    case doctorAppointments(id: Int)
    case doctorReviews(id: Int)
    case handleFavorite(_ id: Int)
    case getFavotites(_ pageNumber: Int)
    case getAboutus
    case getTerms
    case getMyAppointments(_ page: Int)
    case deleteUserAppointment(_ id: Int)
    case bookWithLogin(user: UserDataModel)
    case bookWithRegister(user: UserDataModel)
    case contactus(_ requestData: RequestBodyData)
    case getUser
    case editProfile(user: UserDataModel)
    case saveUserReview(_ id: Int, _ review: String, _ rating: Int)
    case userBookNow(book: BookingData)

    
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self{
        case .getSearchCategoryData, .getMainCategories, .getDoctors, .getDoctorData,.doctorDetails,.doctorReviews, .doctorAppointments, .getAboutus, .getTerms, .getMyAppointments, .getFavotites, .getUser:
            return .get
        case .deleteUserAppointment:
            return .delete
        case .editProfile:
            return .patch
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
        case .handleFavorite(let id),.doctorDetails(let id), .doctorReviews(let id), .doctorAppointments(let id):
            return [ParameterKeys.doctorID: id]
        case .saveUserReview(let id, let comment, let rating):
            return [ParameterKeys.doctorID: id, ParameterKeys.comment: comment, ParameterKeys.rating: rating]
        case .getMyAppointments(let page):
            return [ParameterKeys.paginationPageNumber: page]
        case .getFavotites(let page):
            return [ParameterKeys.paginationPageNumber: page]
        case .deleteUserAppointment(let id):
            return [ParameterKeys.userAppointmentID: id]
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
            return URLs.favorites + "/\(id)" + "/add_remove"
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
        case .registerNewUsersFromPopUp( _):
            return URLs.registerNewUsersPopUP
        case .loginAndBookFromPopUp( _):
            return URLs.LoginUserPopUp
        case .doctorDetails(let id):
            return URLs.doctors + "/\(id)"
        case .doctorReviews(let id), .saveUserReview(let id, _, _):
            return URLs.doctors + "/\(id)" + URLs.reviews
        case .doctorAppointments(let id):
            return URLs.doctors + "/\(id)" + URLs.appointments
        case .userBookNow, .getMyAppointments:
            return URLs.userAppointment
        case .handleFavorite(let id):
            return URLs.favorites + "/\(id)" + URLs.addRemove
        case .editProfile:
            return URLs.user
        case .getFavotites:
            return URLs.favorites
        case .getAboutus:
            return URLs.aboutus
        case .getTerms:
            return URLs.terms
        case .deleteUserAppointment(let id):
            return URLs.userAppointment + "/\(id)"
        case .bookWithLogin:
            return URLs.userAppointment + URLs.userAppointmentWithLogin
        case .bookWithRegister:
            return URLs.userAppointment + URLs.userAppointmentWithRegister
        case .contactus:
            return URLs.contactus
        case .getUser:
            return URLs.user
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
        urlRequest.setValue("Bearer \(token ?? "") ", forHTTPHeaderField: HeaderKeys.authorization)
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
            case .userBookNow(let body):
                return encodeToJSON(body)
            case .contactus(let body):
                return encodeToJSON(body)
            case .editProfile(user: let body):
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

