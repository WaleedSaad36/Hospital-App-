//
//  EditProfileViewModel.swift
//  IDE Hospital
//
//  Created by Elshaer on 10/19/20.
//

import Foundation

protocol EditProfileViewModelProtocol {
    func getUserData(name: String?, email: String?, mobile: String?, password: String?, confrimPassword: String?, oldPassword: String?)
    func getUserData()
}

class EditProfileViewModel {
    
    // MARK:- Private Properties
    private weak var view: EditProfileVCProtocol?
    
    // MARK:- Init
    init(view: EditProfileVCProtocol) {
        self.view = view
    }
}

//MARK:- Conform Protocol
extension EditProfileViewModel: EditProfileViewModelProtocol {
    func getUserData(name: String?, email: String?, mobile: String?, password: String?, confrimPassword: String?, oldPassword: String?) {
        if  vaildFields(name: name, email: email, mobile: mobile, password: password, confirmPassowrd: confrimPassword, oldPassword: oldPassword) {
            var user: UserDataModel!
            if oldPassword == "" {
                user = UserDataModel(name: name!, email: email!, mobile: mobile!)
            } else{
                user = UserDataModel(name: name!, email: email!, mobile: mobile!, password: password!, oldPassword: oldPassword!)
            }
            editUser(userData: user)
        }
    }
    func getUserData(){
        self.view?.showLoader()
        APIManager.getUserData { (response) in
            switch response {
            case .success(let result):
                if result.code == 200 {
                    guard let data = result.data else {return}
                    self.view?.setUserData(user: data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.view?.hideLoader()
        }
    }
}

//MARK:- Validations
extension EditProfileViewModel {
    private func vaildPassword(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    private func vaildFields(name: String?, email: String?, mobile: String?, password: String?, confirmPassowrd: String?, oldPassword: String?) -> Bool {
        if name.isBlank {
            self.view?.showAlert(message: "Name Validation")
            return false
        }
        if email.isBlank {
            self.view?.showAlert(message: "Email Validation")
            return false
        }
        if !Validator.shared().isValid(loginEmailField: email!) {
            self.view?.showAlert(message: "Email Validation")
            return false
        }
        if mobile.isBlank {
            self.view?.showAlert(message: "Mobile Validation")
            return false
        }
        if !Validator.shared().isValid(entry: mobile!, type: .mobile) {
            self.view?.showAlert(message: "Enter Valid Mobile")
            return false
        }
        if !oldPassword.isBlank {
            if !Validator.shared().isValid(entry: oldPassword!, type: .password) {
                self.view?.showAlert(message: "Please Enter old Password")
                return false
            }
            if password.isBlank {
                self.view?.showAlert(message: "please Enter New Password")
                return false
            }
            if !Validator.shared().isValid(entry: password!, type: .password) {
                self.view?.showAlert(message: "New Password Not valid")
                return false
            }
            if confirmPassowrd.isBlank {
                self.view?.showAlert(message: "Please Enter Confirm Password")
                return false
            }
            if !vaildPassword(password: password!, confirmPassword: confirmPassowrd!) {
                self.view?.showAlert(message: "Password Not Validate")
                return false
            }
            return true
        }
        return true
    }
}

//MARK:- APIs
extension EditProfileViewModel {
    private func editUser(userData: UserDataModel?){
        self.view?.showLoader()
        APIManager.editProfile(userData: userData!) { (response) in
            switch response {
            case .success(let result):
                if result.code == 200 {
                    UserDefaultsManager.shared().isLoggedIn = true
                    self.view?.showSuccess(with: "Your Data Has Be Updated")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.view?.hideLoader()
        }
    }
}
