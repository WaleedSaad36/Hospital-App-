//
//  SignUpViewModel.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/5/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
    //MARK:- Protocol ViewModel
protocol SignUpViewModelProtocol:class{
    func enterDataSignUp(name:String,email:String,mobile:String, password:String, confirmPassword:String )
}
class SignUpViewModel{
    
    //MARK:- Private Properties
    private weak var view: SignUpVCProtocol?

    //MARK:- init Class
    init(view:SignUpVCProtocol) {
        self.view = view
    }
    
}
    // MARK:- Extension
extension SignUpViewModel{
   
    private func inputDataSignUp (name:String,email:String,mobile:String, password:String){
        view?.showLoader()
        let body = SignUpData(name: name, email: email, mobile: mobile, password: password)
        
        APIManager.register(body: body) { (response) in
            switch response{
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.showAlertFailure(messege: "Please Try Agin Register")
            case .success(let result):
                print(result.data?.accessToken ?? "")
                print("success send Data to API")
                self.view?.showAlertSuccessfully(messege: "Successfully Register")
            }
        }
        view?.hideLoader()
    }
    
    private func validationData(name:String,email:String,mobile:String, password:String, confirmPassword:String) -> Bool{
        ///////Name////////
        if !ValidationManager.shared().isEmptyName(name: name) {
            self.view?.showAlert(message: """
please Enter Name
name must contain more  at least 3 characters
""")
            return false
        }
        ///////Email////////
        
        if !ValidationManager.shared().isEmptyEmail(email: email) {
            self.view?.showAlert(message: "Please Enter Email Address")
            return false
        }
        if !ValidationManager.shared().isValidEmail(email: email){
            self.view?.showAlert(message: """
Please Enter Email Address Valid
    example@yahoo.com
""")
            return false
        }
        ///////Mobile////////
        
        if !ValidationManager.shared().isEmptyMobile(mobile: mobile) {
            self.view?.showAlert(message: """
Please Enter Mobile Number
must contian 10-digit phone number
""")
            return false
        }
        
        ///////PasswordEmapty////////
        if !ValidationManager.shared().isEmptyPassword(password: password) {
            self.view?.showAlert(message: "Please Enter Password")
            return false
        }
        
        ////////Password Valid///////
        if !ValidationManager.shared().isValidPassword(password: password) {
            self.view?.showAlert(message: """
Password Not Valid
Passowrd contain at least six characters, including Uppercase
,loawercase latters and numbers
""")
            return false
        }
        if !ValidationManager.shared().isEmptyPassword(password: confirmPassword) {
            self.view?.showAlert(message: "Please Enter ConfirmPassword")
            return false
        }
       
        ////////Password Matching//////////
        guard  password == confirmPassword else {
            self.view?.showAlert(message: """
Password not Matching
Please check Confirm Password
""")
            return false
        }
        return true
    }
}
    //MARK:- Confirm Protcol
extension SignUpViewModel : SignUpViewModelProtocol{
    func enterDataSignUp(name: String, email: String, mobile: String, password: String, confirmPassword: String){

        if validationData(name: name, email: email, mobile: mobile, password: password, confirmPassword: confirmPassword){
            inputDataSignUp(name: name, email: email, mobile: mobile, password: password)
        }
    }
    
    
    
}
