//
//  APIManager.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
import Alamofire

class APIManager {
    
    static func bookNow(bookData: BookingData, completion: @escaping (Result<BookNowResponse, Error>)->()){
        request(APIRouter.userBookNow(book: bookData)){ (response) in
            completion(response)
        }
    }
    
    //MARK:- Doctor Details
    static func doctorDetails(doctorID: Int, completion:@escaping (Result<DoctorDataResponse, Error>)-> ()){
        request(APIRouter.doctorDetails(id: doctorID)) { (response) in
            completion(response)
        }
    }
    static func doctorAppointments(doctorID: Int, completion:@escaping (Result<DoctorAppointmentResponse, Error>)-> ()){
        request(APIRouter.doctorAppointments(id: doctorID)) { (response) in
            completion(response)
        }
    }
    static func doctorReviews(doctorID: Int, completion:@escaping (Result<DoctorReviewsResponse, Error>)-> ()){
        request(APIRouter.doctorReviews(id: doctorID)) { (response) in
            completion(response)
        }
    }

    
    static func getFavorites(page: Int, completion: @escaping (Result<FavResponse, Error>) -> ()) {
        request(APIRouter.getFavotites(page)) { response in
            completion(response)
        }
    }
    
    static func getMyAppointments(page: Int, completion: @escaping (Result<MyAppointmentResponse, Error>)-> ()){
        request(APIRouter.getMyAppointments(page)) { (response) in
            completion(response)
        }
    }
    static func deleteAppointment(id: Int, completion: @escaping (Result<RequsetResponse, Error>)->()){
        request(APIRouter.deleteUserAppointment(id)) { (response) in
            completion(response)
        }
    }
    //MARK:- Static Content
    static func getAboutus(completion: @escaping (Result<AboutUsResponse, Error>)->()){
        request(APIRouter.getAboutus){ (response) in
            completion(response)
        }
    }
    static func getTerms(completion: @escaping (Result<TermsAndConditionsResponse, Error>)->()){
        request(APIRouter.getTerms){ (response) in
            completion(response)
        }
    }
    
    static func editProfile(userData: UserDataModel, completion:@escaping (Result<RegisterResponse, Error>)-> ()){
        request(APIRouter.editProfile(user: userData)) { (response) in
            completion(response)
        }
    }
    //MARK:- User
    static func getUserData(completion:@escaping (Result<RegisterResponse, Error>)-> ()){
        request(APIRouter.getUser) { (response) in
            completion(response)
        }
    }
    
    static func handleFavorite(id: Int, completion: @escaping (Result<MainCategoryResponse, Error>) -> ()) {
        request(APIRouter.handleFavorite(id)) { response in
            completion(response)
        }
    }
    //MARK:- Send Request
    static func sendContactUs(requestData: RequestBodyData,completion: @escaping (Result<RequsetResponse, Error>)-> ()) {
        request(APIRouter.contactus(requestData)) { (response) in
            completion(response)
        }
    }
    
    //MARK:- get searchService
    class func getSearchData(id: Int, completion: @escaping (Result<CategoryDataResponse, Error>) -> Void){
        request(APIRouter.getSearchCategoryData(id)) { (response) in
            completion(response)
        }
    }
    
    //MARK:-  SearchResult
    static func getDoctorsList(data: DoctorsQuery, sortBy: String?, page: Int, completion: @escaping (Result<DoctorList, Error>) -> ()) {
        request(APIRouter.getDoctors(data: data, sortBy: sortBy, page: page)) { response in
            completion(response)
        }
    }
    
    class func addAndRemoveFavorite(id: Int, completion: @escaping (Result<addAndRemoveResponse, Error>) -> Void){
        request(APIRouter.addAndRemoveFavorite(id: id)) { (response) in
            completion(response)
        }
    }
    
    //MAKR:- Post HomeNurse
    class func homeNursing(body: RequestDataNurse, completion: @escaping (Result<NurseRequest,Error>)-> Void){
        request(APIRouter.nurseRequest(body)) { (response) in
            completion(response)
        }
    }
    // -------------- Post Auth Data ---------------

    //MARK:-  Auth Data
    class func register(body: SignUpData, completion: @escaping (Result<AuthResponse, Error>)-> Void){
        request(APIRouter.register(data: body)) { (response) in
            completion(response)
            }
        }
    
    class func forgotPassword(email: String, completion: @escaping (Result<ForgetPassowrd, Error>) -> Void){
        request(APIRouter.forgetPassword(email: email)) { (response) in
            completion(response)
        }
    }
    
    class func login(email:String, password:String, completion: @escaping (Result<AuthResponse, Error>) -> Void){
        request(APIRouter.login(email: email, password: password)){ (response) in
            completion(response)
        }
    }
    //MARK:- Post Review Doctors
    class func review(id:Int, rating:Int, comment:String, completion: @escaping (Result<ReviewResponse, Error>)-> Void){
        request(APIRouter.reviewDoctors(id: id, rating: rating, comment: comment)){ (response) in
            completion(response)
        }
        
    }
    //MARK:- Get DoctorData
    class func getDoctorData(doctorId:Int, completion: @escaping (Result<DoctorResponse, Error>)-> Void){
        request(APIRouter.getDoctorData(doctorId)) { (response) in
            completion(response)
        }
        
    }
    
    // -------------- Auth Popups ---------------
    //MARK:- RegisterAndBookForNewUsersFromPOPUPS
    class func registerNewUsersFromPopUp(body: bodyPopupAuth, completion: @escaping (Result<AuthResponse, Error>)-> Void){
        request(APIRouter.registerNewUsersFromPopUp(body: body) ) { (response) in
            completion(response)
        }
    }
    
    //MARK:- LoginAndBookFromPopUp
    class func  loginAndBookFromPopUp(body: BodyLoginPopUp, completion: @escaping (Result<AuthResponse, Error>)-> ()){
        request(APIRouter.loginAndBookFromPopUp(body: body) ){ (response) in
            completion(response)
        }
    }
    
    // -------------- get main Catigories ---------------
    //MARK:- Get main Categories
    class func getMainCategories(completion: @escaping (Result<MainCategoryResponse,Error>) -> Void){
        request(APIRouter.getMainCategories) { (response) in
            completion(response)
        }
    }
}

extension APIManager{
    // MARK:- The request function to get results in a closure
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
            switch response.result {
            
            case .failure(let error):
                completion(.failure(error))
            default:
                return
            }
            print(response)
        }
    }
    
}
