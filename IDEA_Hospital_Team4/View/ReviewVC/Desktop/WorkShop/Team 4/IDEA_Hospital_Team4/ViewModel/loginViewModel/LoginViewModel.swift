//
//  LoginViewModel.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/7/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation
protocol loginViewModelProtocol {
    func enterDataLogin(email: String, password:String) 
}

class LoginViewModel {
    //MARK:- Private Properties
    private var view:LoginVCProtocol?
    //MARK:- init Class
    init(view:LoginVCProtocol) {
        self.view = view
    }
}

extension LoginViewModel{
    
    func validationData(email:String, password:String) -> Bool {
        if !ValidationManager.shared().isEmptyEmail(email: email){
            view?.showAlert(message: "Please Enter Email Address")
            return false
        }
        
        if !ValidationManager.shared().isValidEmail(email: email){
            view?.showAlert(message: """
Please Enter Email Address Valid
    example@yahoo.com
""")

            return false
        }
        
        if !ValidationManager.shared().isEmptyPassword(password: password){
            view?.showAlert(message: "Please Enter Password")
            return false
        }
        
        if !ValidationManager.shared().isValidPassword(password: password){
            view?.showAlert(message: """
Please Enter Passowrd
contian 6 characters and 6 digit
""")
            return false
        }
        return true
    }
    func inputDataLogin(email:String, password:String){
        self.view?.showLoader()
        APIManager.login(email: email, password: password) { response in
            switch response {
            case .failure(let error):
                return print(error)
            case .success(let result):
                print(result.code)
                UserDefaultsManager.shared().token = "Bearer \(String(describing: result.data?.accessToken))"
                UserDefaultsManager.shared().isLoggedIn = true
                print("success data in API")
                self.view?.showAlertSuccessfully(messege: "Login Successfully")
            }
        }
        self.view?.hideLoader()
    }
    
    
}
//MARK:- Confirm Protocol
extension LoginViewModel:loginViewModelProtocol{
    func enterDataLogin(email: String, password: String) {
        if validationData(email: email, password: password){
            inputDataLogin(email: email, password: password)
        }
    }
    
    
}
