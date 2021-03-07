//
//  VoucharViewModel.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/13/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation

protocol VoucharViewModelProtocol : class {
    func doctorBooking(vouchar: String, name: String)
    func getDoctrData()
}

class VoucharViewModel{
    
    //MARK:- Private Properties
    private var view:VoucharVCProtocol?
    private var timeStamp: Int
    private var doctorId: Int = 19
    private var doctorName: String!
    private var voucherState: Bool = true
    private var nameState: Bool = true
    
    //Mark:- init Methods
    init(view:VoucharVCProtocol,doctorId:Int, timeStamp:Int) {
        self.view = view
        self.timeStamp = timeStamp
        self.doctorId = doctorId
    }
    
}
extension VoucharViewModel{
    func getDataDoctorFromAPI (){
        APIManager.getDoctorData(doctorId: doctorId) { (response) in
            switch response{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                print(result)
                self.doctorName = result.data?.name
            }
        }
    }
    
    func validationData(code:String, name:String)  -> Bool {
        
        if !ValidationManager.shared().isEmptyName(name: name){
            self.view?.showAlert(message: """
please Enter Name
name must contain more  at least 3 characters
""")
            return false
        }
        
        if !ValidationManager.shared().isEmptyComments(comment: code){
            view?.showAlert(message: """
please Enter Code Vouchar
Must contain more at least 5 characters or numbers
""")
            return false
        }
        return true
    }
    //MARK:- Private Methods
    private func doctorAppointment(vouchar: String?, patientName: String?){
        view?.sendDataToProfileDoctor(vouchar: vouchar ?? "", name: patientName ?? "" )
    }
}
extension VoucharViewModel:VoucharViewModelProtocol{
    func getDoctrData() {
        getDataDoctorFromAPI()
    }
    
    func doctorBooking(vouchar: String, name: String) {
        if validationData(code: vouchar, name: name){
        doctorAppointment(vouchar: vouchar, patientName: name)
        }
    }
}
