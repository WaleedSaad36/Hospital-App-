//
//  SignUpAndLoginPopUpController.swift
//  IDEA Hospital
//
//  Created by IDE Academy on 1/14/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit

protocol SignUpAndLoginPopUpDelegate: class{
    func getDoctorAppointments()
}

protocol SignUpAndLoginPopUpProtocol: class{
    func showLoader()
    func hideLoader()
    func showAlert(type: AlertTypes, message: String, title: String)
    func showCustomAlertSuccessfullyRequest(type: AlertTypes, message: String, title: String)
    
}

class SignUpAndLoginPopUpController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var signUpAndLoginPopUpView: SignUpandLoginPopupView!
    weak var delegate: SignUpAndLoginPopUpDelegate?

    
    // MARK:- Properties
    private var viewmodel: SignUpAndLoginPopUpViewModelProtocol!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpAndLoginPopUpView.setup()
        viewmodel.setDefaultData()
        signUpAndLoginPopUpView.registerDefault()
        signUpAndLoginPopUpView.loginDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK:- Public Methods
    class func create(doctorId: Int, appointmentTimeStamp: String) -> SignUpAndLoginPopUpController {
        let signUpAndLoginPopUpController = SignUpAndLoginPopUpController()
        signUpAndLoginPopUpController.viewmodel = SignUpAndLoginPopUpViewModel(view: signUpAndLoginPopUpController,doctorId: doctorId, appointmentTimeStamp: appointmentTimeStamp)
        return signUpAndLoginPopUpController
    }
    
    //MARK:- Actions
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        signUpAndLoginPopUpView.registerBtnPressed()
        signUpAndLoginPopUpView.loginDefault()
        viewmodel.setDefaultData()
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        signUpAndLoginPopUpView.loginBtnPressed()
        viewmodel.setDefaultData()
        signUpAndLoginPopUpView.registerDefault()
    }
    
    @IBAction func firstCheckBtn(_ sender: UIButton) {
        viewmodel.getVoucherState(voucherEntered: signUpAndLoginPopUpView.firstCheckBtnTapped())
    }
    
    @IBAction func secondCheckBtn(_ sender: UIButton) {
        viewmodel.getNameState(nameEntered: signUpAndLoginPopUpView.secondCheckBtnTapped())
    }
    
    @IBAction func loginFirstCheckBtn(_ sender: UIButton) {
        viewmodel.getVoucherState(voucherEntered: signUpAndLoginPopUpView.loginFirstCheckBtnTapped())
    }
    
    @IBAction func loginSecondCheckBtn(_ sender: UIButton) {
        viewmodel.getNameState(nameEntered: signUpAndLoginPopUpView.loginSecondcheckBtnTapped())
    }
    
    @IBAction func signUpAndBookBtnTapped(_ sender: IDEHospitalButton) {
        viewmodel.signUpUser(name: signUpAndLoginPopUpView.userNameTxt.text!, email: signUpAndLoginPopUpView.emailAddressTxt.text!, mobile: signUpAndLoginPopUpView.mobileTxt.text!, password: signUpAndLoginPopUpView.choosePasswordtxt.text!, voucher: signUpAndLoginPopUpView.voucharCodeTxt.text!, patientName: signUpAndLoginPopUpView.patiantNameTxt.text!, bookForAnother: signUpAndLoginPopUpView.secondCheckBoxBtn.isSelected)
        sender.setupAnimatedBtn()
    }
    
    @IBAction func loginAndBookBtnTapped(_ sender: IDEHospitalButton) {
        viewmodel.login(email: signUpAndLoginPopUpView.emailTextField.text!, password: signUpAndLoginPopUpView.passwordTextField.text!, voucher: signUpAndLoginPopUpView.checkvoucharTxt.text!, patientName: signUpAndLoginPopUpView.checkNameTxt.text!, bookForAnother: signUpAndLoginPopUpView.checkNameBtn.isSelected)
    }
    
    @IBAction func termsAndConditionsBtnTapped(_ sender: UIButton) {
        goToAboutUsAndTermsVC()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- Extension Private Method
extension SignUpAndLoginPopUpController{
    private func goToAboutUsAndTermsVC() {
        // go to TermsVC
        let goTOTerms :StaticContentVC = StaticContentVC.create(type: .termsAndConditions)
        self.navigationController?.pushViewController(goTOTerms, animated: true)
    }
}

//MARK:- Extension Conform popUps Protocol funcs
extension SignUpAndLoginPopUpController: SignUpAndLoginPopUpProtocol{
    func showLoader() {
        view.showLoading()
    }
    
    func hideLoader() {
        view.hideLoading()
    }
    
    func showAlert(type: AlertTypes, message: String, title: String) {
        self.showCustomAlert(type: type, message: message, title: title, delgate: nil)
    }
    
    func showCustomAlertSuccessfullyRequest(type: AlertTypes, message: String, title: String) {
        showAlert(type: type, message: message, title: title)
            self.dismiss(animated: true){
                self.view.removeFromSuperview()
                self.removeFromParent()
                self.delegate?.getDoctorAppointments()
            
        }
    }
    
}

