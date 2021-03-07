//
//  APIRouter.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/7/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    
    
    // The endpoint name
    case nursingRequests(_ requestBody: RequestBodyData)
    case login(_ email: String, _ password: String)
    case about_us
    case main_Categories
    case categories(_ id: String)
    case addDeleteDoctor(_ id: String)
    case userAppointments
    case deleteUserAppointment(_ id: String)
    case favoritesDoctors
    case doctors(_ id: String, _ specialtyId: String,_ cityId: String,_ regionId: String,_ companyId: String,_ doctorName: String)

    
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
        case  .login, .nursingRequests :
            return .post
        case  .about_us, .main_Categories, .userAppointments, .favoritesDoctors, .doctors, .categories :
            return .get
        case .addDeleteDoctor:
            return .post
        case .deleteUserAppointment:
            return .delete
        }
    }
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [ParameterKeys.email: email, ParameterKeys.password: password ]
        case .doctors(let id, let specialtyId, let cityId, let regionId, let companyId, let doctorName):
            return [ParameterKeys.specialtyId: specialtyId, ParameterKeys.cityId: cityId, ParameterKeys.regionId: regionId, ParameterKeys.companyId: companyId, ParameterKeys.name: doctorName ]
        default:
            return nil
        }
    }
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return URLs.login
        case .about_us:
            return URLs.about_us
        case .nursingRequests:
            return URLs.nursing_requests
        case .main_Categories:
            return URLs.main_Categories
        case .categories(let id):
            return URLs.category + "/\(id)" + URLs.doctorQuary
        case .favoritesDoctors :
            return URLs.favoritesDoctors
        case .addDeleteDoctor(let id):
            return URLs.favoritesDoctors + "/\(id)" + URLs.addOrDeleteDoctors
        case .userAppointments :
            return URLs.userAppointments
        case .deleteUserAppointment(let id) :
            return URLs.userAppointments + "/\(id)"
        case .doctors(let id,_,_,_,_,_):
                    return URLs.category + "/\(id)" + URLs.doctors
                }

        }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        print(url)
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        //httpMethod
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(HeaderValues.applicationJson, forHTTPHeaderField: HeaderKeys.contentType)
        print(HeaderValues.applicationJson)
        switch self {
        case .categories:
            urlRequest.setValue(HeaderValues.acceptLanguage, forHTTPHeaderField: HeaderKeys.acceptLanguage)
            urlRequest.setValue(HeaderValues.accept, forHTTPHeaderField: HeaderKeys.accept)
            urlRequest.setValue(HeaderValues.categoryToken, forHTTPHeaderField: HeaderKeys.categoryToken)
        case .addDeleteDoctor , .userAppointments , .deleteUserAppointment, .favoritesDoctors:
            urlRequest.setValue(HeaderValues.brearerToken, forHTTPHeaderField: HeaderKeys.authorization)
        case .doctors:
            urlRequest.setValue(HeaderValues.acceptLanguage, forHTTPHeaderField: HeaderKeys.acceptLanguage)
            urlRequest.setValue(HeaderValues.accept, forHTTPHeaderField: HeaderKeys.accept)
            urlRequest.setValue(HeaderValues.brearerToken,forHTTPHeaderField: HeaderKeys.authorization)
            urlRequest.setValue(HeaderValues.doctorCategoryToken, forHTTPHeaderField: HeaderKeys.categoryToken)
        case .nursingRequests:
            urlRequest.setValue(HeaderValues.accept, forHTTPHeaderField: HeaderKeys.accept)
            urlRequest.setValue(HeaderValues.accept, forHTTPHeaderField: HeaderKeys.contentType)
         //   urlRequest.setValue(HeaderValues.doctorCategoryToken, forHTTPHeaderField: HeaderKeys.categoryToken)
        default:
            urlRequest.setValue(HeaderValues.acceptLanguage, forHTTPHeaderField: HeaderKeys.acceptLanguage)
        }
        // MARK: - HTTP Body
        let httpBody: Data? = {
            switch self {
            case .nursingRequests(let body):
                return encodeToJSON(body)
            default:
                return nil
            }
        }()
        urlRequest.httpBody = httpBody
        // MARK: - Encoding
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
// MARK: - extension
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

