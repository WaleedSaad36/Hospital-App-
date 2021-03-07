//
//  SignUpAndLoginPopUpViewModel.swift
//  IDEA Hospital
//
//  Created by Hossam Yasser on 1/8/21.
//  Copyright © 2021 Yasser Aboibrahim. All rights reserved.
//

import Foundation

//MARK:- SignUpAndLoginPopUpViewModelProtocol Protocol
protocol SignUpAndLoginPopUpViewModelProtocol : class {
    func signUpUser(name: String, email: String, mobile: String, password: String, voucher: String, patientName: String, bookForAnother: Bool)
    func login(email: String , password: String, voucher: String, patientName: String, bookForAnother: Bool)
    func getNameState(nameEntered: Bool)
    func getVoucherState(voucherEntered: Bool)
    func setDefaultData()
}

class SignUpAndLoginPopUpViewModel{
    //MARK:- Properties
    private weak var view: SignUpAndLoginPopUpProtocol!
    private var patientName: String!
    private var bookForAnother: Bool!
    private var doctorId: Int
    private var appointmentTimeStamp: String
    private var voucherState: Bool = false
    private var nameState: Bool = false
    private var voucherValue: String? = nil
    
    init(view: SignUpAndLoginPopUpProtocol,doctorId: Int, appointmentTimeStamp: String){
        self.view = view
        self.doctorId = doctorId
        self.appointmentTimeStamp = appointmentTimeStamp
    }
}

//MARK:- Extension Private Methods
extension SignUpAndLoginPopUpViewModel{
    private func dataValidation(name: String , email: String , mobile: String, password: String, voucher: String, patientName: String) ->Bool {
        if !ValidationManager.shared().isEmptyName(name: name){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Please Enter Your Username", title: "OK")
            return false
        }
        
        
        if !ValidationManager.shared().isEmptyEmail(email: email){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Please Enter Email Address", title: "OK")
            return false
        }
        
        if !ValidationManager.shared().isValidEmail(email: email){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: """
Please Enter Email Address Valid
    example@yahoo.com
""", title: "OK")
            return false
        }
        
        if !ValidationManager.shared().isEmptyMobile(mobile: mobile){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: """
Please Enter Mobile Number
    +02***********
""", title: "OK")
            return false
        }
        if !ValidationManager.shared().isEmptyPassword(password: password){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Please Enter Choose Password", title: "OK")
            return false
        }
        
        
        
        if !ValidationManager.shared().isValidPassword(password: password){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: """
Password Not Valid
Passowrd contain at least six characters, including Uppercase
,loawercase latters and numbers
""", title: "OK")
            return false
        }
        
        if voucherState{
            if !ValidationManager.shared().isEmptyComments(comment: voucher) {
                self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Please Enter Voucher code five digits", title: "ok")
                return false
            }else{
                voucherValue = voucher
            }
        }
        
        if nameState{
            if !ValidationManager.shared().isEmptyComments(comment: patientName) {
                self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Patient Name is required", title: "ok")
                return false
            }
        }
        return true
    
}
     private func dataValidator( email: String , password: String, voucher: String, patientName: String) ->Bool {
        
        if !ValidationManager.shared().isEmptyEmail(email: email){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Please Enter Email Address", title: "OK")
            return false
        }
        
        if !ValidationManager.shared().isValidEmail(email: email){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message:"""
Please Enter Email Address Valid
    example@yahoo.com
""", title: "OK")
            return false
        }
        
        if !ValidationManager.shared().isValidPassword(password: password){
            self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: """
Password Not Valid
Passowrd contain at least six characters, including Uppercase
,loawercase latters and numbers
""", title: "OK")
            return false
        }
        
        if voucherState{
            if !ValidationManager.shared().isEmptyComments(comment: voucher) {
                self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Please Enter Voucher Code", title: "OK")
                return false
            }else{
                voucherValue = voucher
            }
        }
        if nameState{
            if !ValidationManager.shared().isEmptyComments(comment: patientName) {
                self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Patient Name is required", title: "ok")
                return false
            }
        }
        return true
    }
    
    private func signUpWithEnteredData(name: String, email: String, mobile: String, password: String, voucher: String, patientName: String, bookForAnother: Bool) {
        view.showLoader()
        let body = bodyPopupAuth(name: name, email: email, mobile: mobile, password: password, doctorId: self.doctorId, appointment: self.appointmentTimeStamp, voucher: self.voucherValue, patientName: patientName, bookForAnother: bookForAnother)
        APIManager.registerNewUsersFromPopUp(body: body){ (response) in
            switch response {
            case .failure (let error):
                print(error.localizedDescription)
                print(error)
            case .success(let result):
                print(result)
                print(result.data?.accessToken!)
                UserDefaultsManager.shared().token = "Bearer \(result.data?.accessToken ?? "")"
                UserDefaultsManager.shared().isLoggedIn = true
                self.view.showCustomAlertSuccessfullyRequest(type: .successButton, message: "Successfully Booked", title: "OK")
                }
            }
        self.view.hideLoader()

        }
    
    private func signInWithEnteredData(email: String, password: String, voucher: String, patientName: String, bookForAnother: Bool){
        self.view.showLoader()

        let body = BodyLoginPopUp(email: email, password: password, doctorId: self.doctorId, appointment: self.appointmentTimeStamp, voucher: self.voucherValue, patientName: patientName, bookForAnother: bookForAnother)
        APIManager.loginAndBookFromPopUp(body: body){ response in
            switch response{
            case .failure(let error):
                if error.localizedDescription == "The data couldn’t be read because it isn’t in the correct format." {
                    self.view.showAlert(type: .defaultAlert(title: "Sorry"), message: "Something went wrong please try again", title: "OK")
                }
                print(error)
            case .success(let result):
                
                    print(result.code)
                    UserDefaultsManager.shared().token = "Bearer \(result.data?.accessToken ?? "")"
                    UserDefaultsManager.shared().isLoggedIn = true
                    self.view.showCustomAlertSuccessfullyRequest(type: .successButton, message: "Successfully Booked", title: "OK")
                
            }
        }
        self.view.hideLoader()
    }
    
}

//MARK:- Extension DoctorProfileViewModel Protocol funcs
extension SignUpAndLoginPopUpViewModel: SignUpAndLoginPopUpViewModelProtocol{
    func getNameState(nameEntered: Bool) {
        nameState = nameEntered
        patientName = ""
    }
    
    func getVoucherState(voucherEntered: Bool) {
        voucherState = voucherEntered
        voucherValue = nil
    }
    
    func signUpUser(name: String, email: String, mobile: String, password: String, voucher: String, patientName:String , bookForAnother: Bool ) {
        if dataValidation(name: name, email: email, mobile: mobile, password: password, voucher: voucher, patientName: patientName) {
            signUpWithEnteredData( name: name, email: email, mobile: mobile, password: password, voucher: voucher, patientName: patientName, bookForAnother: bookForAnother)
        }
    }
    
    func login(email: String , password: String, voucher: String, patientName: String, bookForAnother: Bool){
        if dataValidator(email: email, password: password, voucher: voucher, patientName: patientName){
            signInWithEnteredData(email: email, password: password, voucher: voucher, patientName: patientName, bookForAnother: bookForAnother)
        }
    }
    
    func setDefaultData(){
        self.voucherValue = nil
        self.voucherState = false
        self.nameState = false
    }
    }





