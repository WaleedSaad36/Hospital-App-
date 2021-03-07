//
//  SignUpViewModel.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/5/21.
//  Copyright © 2021 IOS. All rights reserved.

import Foundation

//MARK:- ResetPasswordViewModel Protocol
protocol ResetPasswordViewModelProtocol : class {
    func resetForgottenPassword(email: String)
    
}

class ResetPasswordViewModel {

    //MARK:- Properties
    private weak var view: ResetPasswordVCProtocol!
    
    init(view: ResetPasswordVCProtocol){
        self.view = view
    }
}

//MARK:- Extension Private Methods
extension ResetPasswordViewModel {
    
    private func ResetPassword(email: String) {
        view.showLoader()
        APIManager.forgotPassword(email: email) { [weak self] (response) in
            switch response {
            case .failure(let error):
                print(error)
                self?.view.showAlertFailure(messege: "Please Try Agin")
            case .success(let result):
                print(result)
                self?.view.showAlertSuccessfully(messege: "yor will recvied an email with the steps how to set a new password")
            }
        }
            view.hideLoader()
    }
}
//MARK:-Extension ResetPassword
extension ResetPasswordViewModel{
    private func validationData(emailAddress:String) -> Bool{
        if !ValidationManager.shared().isEmptyEmail(email: emailAddress) {
            view.showAlert(message: "Pleas Enter Email Address")
            return false
        }
        if !ValidationManager.shared().isValidEmail(email: emailAddress){
            view.showAlert(message: """
Please Enter Valid Email
   example@mail.com
""")
            return false
        }
        return true
    }
}

//MARK:- Extension ResetPasswordViewModel Protocol funcs
extension ResetPasswordViewModel : ResetPasswordViewModelProtocol {
    func resetForgottenPassword(email: String) {
        if validationData(emailAddress: email){
            ResetPassword(email: email)
        }
        
    }
}

