//
//  homeNurseViewModel.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 12/28/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit
protocol HomeNurseViewModelProtocol:class {
    func sendDataHomeNurse(name:String,email:String,mobile:String,messege:String)
}


class homeNurseViewModel{
    private var view :HomeNurseVCProtocol!
    
    init(view: HomeNurseVCProtocol){
        self.view = view
    }
    private func dataValidation(name: String?, email: String?, mobile: String?, message: String) ->Bool {
        if !ValidationManager.shared().isEmptyName(name: name){
           self.view.showAlert(messege: "Please Enter Username")
            return false
        }
        
        if !ValidationManager.shared().isEmptyEmail(email: email){
            self.view.showAlert(messege: "Please Enter Email Address")
            return false
        }
        
        if !ValidationManager.shared().isValidEmail(email: email){
            view.showAlert(messege: """
Please Enter Email Address Valid
    example@yahoo.com
""")
            return false
        }
        
        if !ValidationManager.shared().isEmptyMobile(mobile: mobile){
            view.showAlert(messege: "Please Enter Mobile Number")
            
            return false
        }
        if !ValidationManager.shared().isEmptyName(name: message){
            view.showAlert(messege: "Please Enter Detials Field")
            return false
        }
        if message == "Enter Detials"{
            return false
        }
        
        return true
    }
    

    func homeNurseRequest(name: String, email: String, mobile: String, messege: String) {
        view.showLoader()
        let body = RequestDataNurse(name: name, email: email, mobile: mobile, message: messege)
        APIManager.homeNursing(body: body){ (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
                print("home Nurse not valid data To API ")
                self.view.showAlertFailure(messege: "Please Try Agin Request")
            case .success(let success):
                self.view.showAlertSuccessfully(messege: "Your Request Sent successfully")
                self.view.goToMainHome()
            }
        }
        self.view.hideLoader()
    }
}

extension homeNurseViewModel:HomeNurseViewModelProtocol{
    func sendDataHomeNurse(name: String, email: String, mobile: String, messege: String) {
        if dataValidation(name: name, email: email, mobile: mobile, message: messege){
            homeNurseRequest(name: name, email: email, mobile: mobile, messege: messege)
        }
    }
    
}
