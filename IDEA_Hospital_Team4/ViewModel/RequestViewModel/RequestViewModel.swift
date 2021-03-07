//
//  RequestViewModel.swift
//  IDE Hospital
//
//  Created by Ibrahim El-geddawy on 10/21/20.
//

import Foundation

protocol RequestViewModelProtocol {
    func getRequestData(name: String?, email: String?, mobile: String?,message: String?)
    func requestType()-> RequestType
    func navigationTitle()-> String
    func textViewPlaceholder()-> String
}

class RequestViewModel{
    
    // MARK:- Private Properties
    private weak var view: RequestVCProtocol?
    private var type: RequestType!
    
    // MARK:- Init
    init(view: RequestVCProtocol, type: RequestType) {
        self.view = view
        self.type = type
    }
}

//MARK:- Conform Protocol
extension RequestViewModel: RequestViewModelProtocol{
    func getRequestData(name: String?, email: String?, mobile: String?,message: String?) {
        if  vaildFields(name: name, email: email, mobile: mobile,message: message) {
            let requestData = RequestBodyData(name: name, mobile: mobile, email: email, message: message)
            sendRequest(request: requestData)
        }
    }
    func navigationTitle() -> String {
        switch type {
        case .contactus?:
            return "Contact Us".capitalized
        default:
            return "Home Nurse"
        }
    }
    func requestType() -> RequestType {
        return self.type
    }
    func textViewPlaceholder() -> String {
        switch type {
        case .contactus?:
            return "Your Message"
        default:
            return "Enter Details"
        }
    }
}

//MARK:- APIsYextension RequestViewModel{
extension RequestViewModel {
    private func sendRequest(request: RequestBodyData) {
        switch type {
        case .contactus?:
            self.sendContactUs(requestData: request)
        default:
            self.sendNurse(requestData: request)
        }
    }
    private func sendContactUs(requestData: RequestBodyData){
        self.view?.showLoader()
        APIManager.sendContactUs(requestData: requestData) { (response) in
            switch response{
            case .success(let result):
                switch result.code {
                case 202:
                    self.view?.showSuccess(with: "Request Success")
                default:
                    self.view?.showError(with: result.message ?? "")
                }
            case .failure(let error):
                self.view?.showError(with: error.localizedDescription)
            }
            self.view?.hideLoader()
        }
    }
    private func sendNurse(requestData: RequestBodyData){
        
//        self.view?.showLoader()
//        APIManager.sendNurseRequest(requestData: requestData) { (response) in
//            switch response{
//            case .success(let result):
//                switch result.code {
//                case 202:
//                    self.view?.showSuccess(with: "Request Success")
//                default:
//                    self.view?.showError(with: result.message ?? "")
//                }
//            case .failure(let error):
//                self.view?.showError(with: error.localizedDescription)
//            }
//            self.view?.hideLoader()
//        }
    }
}

//MARK:- Validation
extension RequestViewModel{
    private func vaildFields(name: String?, email: String?, mobile: String?,message: String?) -> Bool {
        if name.isBlank {
            self.view?.showError(with: "Name Validation")
            return false
        }
        if email.isBlank {
            self.view?.showError(with: "Email Validation")
            return false
        }
        if !Validator.shared().isValid(entry: email!, type: .email){
            self.view?.showError(with: "Enter Valid Email")
            return false
        }
        if mobile.isBlank {
            self.view?.showError(with: "Mobile Validation")
            return false
        }
        if !Validator.shared().isValid(entry: mobile!, type: .mobile){
            self.view?.showError(with: "Enter Valid Mobile")
            return false
        }
        if message == self.textViewPlaceholder() {
            self.view?.showError(with: "Message Validation")
            return false
        }
        return true
    }
}
