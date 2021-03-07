//
//  ReviewViewModel.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/12/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation
protocol ReviewViewModelProtocol:class{
    func sendReview(rating: Int, comment: String )
    
}

class ReviewViewModel{
    
    //MARK:- Properties
    private weak var view:ReviewVCProtocol?
    private var doctorId:Int?
    //MARK:- initClass
    init(view:ReviewVCProtocol, doctorId:Int) {
        self.view = view
        self.doctorId = doctorId
    }
    
    
}
extension ReviewViewModel{
    
    func validtionComments(comment:String) -> Bool{
        if !ValidationManager.shared().isEmptyComments(comment: comment){
            self.view?.showAlert(message: """
Please Enter Comment Details
Contian More 10 Characters
""")
            return false
        }
        return true
    }
    
    func sendReviewDoctors(rating:Int , comment:String){
        self.view?.showLoader()
        APIManager.review(id: self.doctorId ?? 0, rating: rating, comment: comment) { response in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.showAlertFailure(messege: "Please Try Agin Review")
            case .success(let result):
                print("success Sent Data Review Doctors")
                print(result)
                self.view?.showAlertSuccessfully(messege: "Thanks for Rating")
                
            }
        }
        self.view?.hideLoader()
    }
    
}
extension ReviewViewModel:ReviewViewModelProtocol{
    func sendReview(rating: Int, comment: String) {
        if validtionComments(comment: comment){
            sendReviewDoctors(rating: rating, comment: comment)
        }
    }
    
    
}
