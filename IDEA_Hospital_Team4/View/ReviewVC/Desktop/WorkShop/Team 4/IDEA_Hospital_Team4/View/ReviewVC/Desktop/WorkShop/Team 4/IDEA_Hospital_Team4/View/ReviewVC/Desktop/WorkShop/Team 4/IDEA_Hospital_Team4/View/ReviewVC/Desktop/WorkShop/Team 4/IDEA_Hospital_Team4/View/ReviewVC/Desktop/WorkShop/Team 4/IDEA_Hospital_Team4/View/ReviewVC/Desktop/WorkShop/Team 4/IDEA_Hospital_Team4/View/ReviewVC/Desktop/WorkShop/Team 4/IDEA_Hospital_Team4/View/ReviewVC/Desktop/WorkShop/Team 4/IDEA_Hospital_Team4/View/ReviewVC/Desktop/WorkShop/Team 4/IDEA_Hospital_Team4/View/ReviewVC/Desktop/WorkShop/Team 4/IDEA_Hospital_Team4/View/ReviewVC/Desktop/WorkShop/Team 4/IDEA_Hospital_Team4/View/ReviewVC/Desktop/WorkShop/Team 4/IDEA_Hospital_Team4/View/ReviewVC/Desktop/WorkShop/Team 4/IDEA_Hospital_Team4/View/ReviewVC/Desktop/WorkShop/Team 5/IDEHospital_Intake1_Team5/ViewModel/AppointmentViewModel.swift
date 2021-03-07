//
//  AppointmentViewModel.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/21/20.
//  Copyright © 2020 Abeer. All rights reserved.
//
//MARK:- Protocol of AppointmentViewModelProtocol
protocol AppointmentViewModelProtocol {
    func serviceOfGetAllAppointments()
    func getGetAllAppointmentItems()-> [AppointmentItems]
    func callDeleteService(_ item: AppointmentItems!)
    func tryDeleteItemConfirm(row: Int, indexPath: IndexPath, item: AppointmentItems)
}
import Foundation
//MARK:- AppointmentViewModel
class AppointmentViewModel {
    //MARK:- Properties
    private weak var appointmentsVC: AppointmentVCProtocol!
    init(appointmentsVC: AppointmentVCProtocol) {
        self.appointmentsVC = appointmentsVC
    }
    var appointmentItemsArray = [AppointmentItems]()
}
//MARK:- extension
extension AppointmentViewModel: AppointmentViewModelProtocol  {
    
    //  Delete item
    func callDeleteService(_ item: AppointmentItems!){
        let id = String(item.id)
        self.appointmentsVC?.processOnStart()
        APIManager.deleteUserAppointment(id){ (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
                self.appointmentsVC?.showErrorMsg(message: (error.localizedDescription))
            case .success(let result):
                let result = result
                if result.success == true {
                    self.appointmentsVC?.processOnStop()
                    self.appointmentsVC?.showSuccessMsg(message:Messages.deleteItemSuccessMsg)
                    self.appointmentsVC.reloadData()
                    //self.serviceOfGetAllAppointments()
                  //  self.appointmentsVC.reloadData()
                }
            }
            self.appointmentsVC?.processOnStop()
        }
    }
    func getGetAllAppointmentItems() -> [AppointmentItems] {
        return self.appointmentItemsArray
    }
    func tryDeleteItemConfirm(row: Int, indexPath: IndexPath, item: AppointmentItems) {
    }
    
    //MARK:-  Handle Response
    func serviceOfGetAllAppointments(){
        self.appointmentsVC?.processOnStart()
        APIManager.userAppointments { (response) in
            switch response{
            case .failure(let error):
                print("there is error \(error.localizedDescription)")
                self.appointmentsVC.showErrorMsg(message: "\(error.localizedDescription)")
            case .success(let result):
                print("\(HeaderValues.brearerToken)")
                self.appointmentItemsArray = result.data.items
                print("in response : \(self.appointmentItemsArray)")
                if  self.appointmentItemsArray.count == 0 {
                    print("no data fetch")
                    self.appointmentsVC.noItemsConfiguration()
                }else {
                    print("count in data: \(self.appointmentItemsArray.count)")
                    self.appointmentsVC?.reloadData()
                }
                self.appointmentsVC?.processOnStop()
            }
        }
    }
}
