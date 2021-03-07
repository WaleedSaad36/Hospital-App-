//
//  MyFavoritesVCViewController.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/16/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
//MARK:- Protocol

protocol AppointmentVCProtocol: class {
    func showErrorMsg(message: String)
    func showSuccessMsg(message: String)
    func processOnStart()
    func processOnStop()
    func presentAlert()
    func reloadData()
    func noItemsConfiguration()
    func deleteRows(_ indexPath: Int)
    func confirmationAlert1(title: String,message: String)
    func showAlertWithTwoActions(title: String, message: String, firstBtn: UIAlertAction)
}
class AppointmentVC: UIViewController{
    // MARK:- Outlets
    @IBOutlet weak var appointmentView: AppointmentView!
    //MARK:- Properties
    var appointmentViewModel: AppointmentViewModelProtocol!
    var infoLoc : InfLocData?
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationStyle()
        self.appointmentView.tintColor = .clear
        self.appointmentViewModel = AppointmentViewModel(appointmentsVC: self)
        self.appointmentView.noAppointmentLabel.isHidden = true
        self.appointmentViewModel?.serviceOfGetAllAppointments()
        self.appointmentView.setup()
        self.setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }
    private func setupTableView(){
        self.appointmentView.appointmentTableView.dataSource = self
        self.appointmentView.appointmentTableView.delegate = self
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }


    class func create() -> AppointmentVC {
        let appointmentVC: AppointmentVC = UIViewController.create(storyboardName: Storyboards.mainTabBar, identifier: ViewControllers.appointmentVC)
        appointmentVC.appointmentViewModel = AppointmentViewModel(appointmentsVC: appointmentVC)
        return appointmentVC
    }
}
    // MARK:- Table View Methods
extension AppointmentVC : UITableViewDataSource , UITableViewDelegate,AppointmentsCellDelegate  {
    
        func deletePressButton(_ tag: Int) {
            let item = self.appointmentViewModel.getGetAllAppointmentItems()[tag]
           // self.showMsgToDelete()
            let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to delete the appointment ? ", preferredStyle: .alert)

            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                
                self.appointmentViewModel?.callDeleteService(item)
                self.appointmentView.appointmentTableView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
                NSLog("Cancel Pressed")
            }

            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            // Present the controller
            self.appointmentView.appointmentTableView.reloadData()
            self.present(alertController, animated: true, completion: nil)

        }
    
        func mapViewPressButton(_ tag: Int) {
            let item = self.appointmentViewModel.getGetAllAppointmentItems()[tag]
            infoLoc = InfLocData.init(lat: item.doctor.lat, lng: item.doctor.lng, name: item.doctor.name, address: item.doctor.address)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(infoLoc), forKey:UserDefaultsKeys.infoLocData)

            print("InfLocData : \(InfLocData.init(lat: item.doctor.lat, lng: item.doctor.lng, name: item.doctor.name, address: item.doctor.address))")
            print("infoLoc in cell : \(infoLoc)")
            self.navigationController?.pushViewController(ViewLocationInMapVC.create(), animated: true)
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("array of favorite : \(self.appointmentViewModel.getGetAllAppointmentItems())")
            return self.appointmentViewModel.getGetAllAppointmentItems().count
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.appointmentsCell , for: indexPath) as! AppointmentsCell
            cell.backgroundColor = .none
            cell.delegate = self
            cell.setup()
            cell.mapViewButton1.tag = indexPath.row
            cell.deleteButton1.tag = indexPath.row
            let item = self.appointmentViewModel.getGetAllAppointmentItems()[indexPath.row]
            cell.setupAppointmentCellData(object: item)
            return cell        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 80

           // tableView.estimatedRowHeight = 240
            return UITableView.automaticDimension
        }
    }
//MARK:- Extension
// Confirm protocol
extension AppointmentVC: AppointmentVCProtocol {
    func reloadData() {
        self.appointmentView?.appointmentTableView.reloadData()
    }
    
    
    func presentAlert() {
    }
    
    
    
    func noItemsConfiguration() {
        self.appointmentView.noAppointmentLabel.isHidden = false
    }
    
    func deleteRows(_ indexPath: Int) {
    }
    
    func confirmationAlert1(title: String,message: String){
        let okAction =  UIAlertAction(title: AlertActionTitle.yes, style: .default, handler: nil)
        self.confirmationAlert(title: title, message: message, firstBtn: okAction)
    }
    func showErrorMsg(message: String){
        self.presentError(with: message)
    }
    func showSuccessMsg(message: String){
        self.showAlert(message: message, title: AlertActionTitle.success)
    }
    func processOnStart(){
        self.view.processOnStart()
    }
    func processOnStop(){
        self.view.processOnStop()
    }
    func showAlertWithTwoActions(title: String, message: String, firstBtn: UIAlertAction){
        self.showCustomAlertWithAction(title: title, message: message, firstBtn: firstBtn)
    }
}
    
    

