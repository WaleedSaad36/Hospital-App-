//
//  TestVC.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/14/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
//MARK Delegate Protocol Test
protocol TestVCProtocol:class {
    func setDataFromDelegate(voucher: String?, patientName: String)
}

class TestVC: UIViewController {

    //MARK:-  Outlets
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    //MARK:-  Propeties
    var timestamp = 12444555
    var name = "waleed"
    private var viewVC: VoucharVCProtocol!
    private var viewModel: SignUpAndLoginPopUpViewModelProtocol?
    
    //MARK:-  LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    class func create() -> TestVC {
        let testVC: TestVC = UIViewController.create(storyboardName: Storyboards.test, identifier: viewControllers.testVC )
        return testVC
    }
    
    
    
    //MARK:- ABAction Button VC
    @IBAction func bookNow(_ sender: Any) {
        //goToVoucherVC(appintmentTimeStamp: timestamp, doctorId: 18)
        gotoSignUpAndLogin(appintmentTimeStamp: "115487", doctorId: 18)
    }
    //func goToVoucherVC(){
        
//        if UserDefaultsManager.shared().token != nil {
//            view.goToVoucherVC(appintmentTimeStamp: self.appintmentTimeStamp, doctorId: self.doctorId)
//        }else {
//            goTOLoginPopUp
//        }
        
    //}
    
    // MARK:- private Methods
    private func goToVoucherVC(appintmentTimeStamp: Int, doctorId: Int){
        let voucharVC: VoucharPopVC = VoucharPopVC.create(doctorId: doctorId, timeStemp: appintmentTimeStamp)
        voucharVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        voucharVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        voucharVC.delegate = self
        voucharVC.delegatePopUps = self
        self.present(voucharVC, animated: true, completion: nil)
    }
    
    private func gotoSignUpAndLogin( appintmentTimeStamp: String, doctorId: Int){
        let authPopup = SignUpAndLoginPopUpController.create(doctorId: doctorId, appointmentTimeStamp: appintmentTimeStamp)
        authPopup.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        authPopup.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        authPopup.delegate = self
        self.present(authPopup, animated: true, completion: nil)
    }
}

//MARK:- CONFIRM PROTOCOL DELEGATE VOUCHAR
extension TestVC: VoucharDelegate{
    func voucharData(code: String, name: String) {
        self.firstLabel.text = code
        self.secondLabel.text = name
        showCustomAlert(type: .confirmButton(timeStamp: 1154, docName: name), message: "", title: "Confirm", delgate: self)
    };
    func cancelTapped() {
        let cancel = presentingViewController
        self.dismiss(animated: true, completion: nil)
        
    }
    func confirmTapped() {
        print("confirm tapped successfully")
    }
}
extension TestVC: TestVCProtocol, DoctorProfilePopUps{
    func continuePresent() {
        _ = AlertViewController.create(type: .confirmButton(timeStamp: self.timestamp , docName: self.name ))
    }
    
    func setDataFromDelegate(voucher: String?, patientName: String) {
        self.firstLabel.text = voucher
        self.secondLabel.text = patientName
    }
}
extension TestVC: SignUpAndLoginPopUpDelegate{
    func getDoctorAppointments() {
//        doctorProfileView.bookButtonDeselectionState()
//        viewModel.getDoctorAppointmentsWithId()
    }
}
