//
//  VoucharPopVC.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/12/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
protocol VoucharDelegate:class {
    func voucharData(code: String, name: String)
    func confirmTapped()
    func cancelTapped()
}
protocol DoctorProfilePopUps{
    func continuePresent()
}

protocol VoucharVCProtocol:class {
    func showAlert(message: String)
    func showAlertFailure(messege: String)
    func showAlertSuccessfully(messege: String)
    func showLoader()
    func hideLoader()
    func sendDataToProfileDoctor(vouchar: String, name: String)
}


class VoucharPopVC: UIViewController {

    //MARK:- outlets
    @IBOutlet var voucharView: VoucharView!
    //MARK:- Private Properties
    weak var delegate:VoucharDelegate?
    var delegatePopUps:DoctorProfilePopUps?
    private var viewModel: VoucharViewModelProtocol?
    
    //MARK:- lifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        voucharView.setup()
        viewModel?.getDoctrData()
    }
    
    //MARK:- PublicMethods
    class func create(doctorId: Int, timeStemp: Int ) -> VoucharPopVC{
        let voucharVC:VoucharPopVC = VoucharPopVC()
        return voucharVC
    }
    
    @IBAction func voucharSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            voucharView.codeTxt.isHidden = false
            voucharView.codeTxt.isEnabled = true
            voucharView.voucharSwitch.thumbTintColor = .white
        }else {
            voucharView.codeTxt.isHidden = true
            voucharView.codeTxt.isEnabled = false
            voucharView.voucharSwitch.thumbTintColor = UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
            voucharView.voucharSwitch.tintColor = UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
            
        }
      
    }
    
    
    @IBAction func bookingSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            voucharView.nameTxt.isHidden = false
            voucharView.nameTxt.isEnabled = true
            voucharView.bookingSwich.thumbTintColor = .white
        }else {
            voucharView.nameTxt.isHidden = true
            voucharView.nameTxt.isEnabled = false
            voucharView.bookingSwich.thumbTintColor = UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
            voucharView.bookingSwich.tintColor = UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
        }
    }
    
    
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        if voucharView.voucharSwitch.isOn {
            if voucharView.codeTxt.text.isBlank {
             self.showAlertFailure(messege: "Sorry You Have To Enter Voucar code")
                return
            }
        }
        else if voucharView.bookingSwich.isOn{
            if voucharView.nameTxt.text.isBlank  {
                self.showAlertFailure(messege: "Sorry You Have To Enter Patian Name")
                return
            }
        }
            self.dismiss(animated: false){
                self.viewModel?.doctorBooking(vouchar: self.voucharView.codeTxt.text ?? "", name: self.voucharView.nameTxt.text ?? "")
                self.delegate?.voucharData(code: self.voucharView.codeTxt.text ?? "" , name: self.voucharView.nameTxt.text ?? "")
    }
}
}
extension VoucharPopVC:VoucharVCProtocol{
    func sendDataToProfileDoctor(vouchar: String, name: String) {
        self.delegate?.voucharData(code: vouchar, name: name)
    }
    
    func showAlert(message: String) {
        showCustomAlert(type: .defaultAlert(title: "Sorry"), message: message, title: "Ok", delgate: nil)
    }
    func showAlertFailure(messege: String) {
        showCustomAlert(type: .failButton, message: messege, title: "Ok", delgate: nil)
    }
    func showAlertSuccessfully(messege: String) {
        showCustomAlert(type: .successButton, message: messege, title: "OK", delgate: nil)
    }
    func showLoader() {
        voucharView?.showLoading()
    }
    func hideLoader() {
        voucharView?.hideLoading()
    }
    func showAlertContinue(message:String){
        showCustomAlert(type: .twoButtons, message: message, title: "", delgate: nil)
    }
}
