//
//  SignUpVC.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/4/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
// MARK:- POP
protocol SignUpVCProtocol:class{
    func showLoader()
    func hideLoader()
    func showAlert(message: String)
    func showAlertFailure(messege: String)
    func showAlertSuccessfully(messege: String)
}

class SignUpVC: UIViewController {
    // MARK:- OutLets
    @IBOutlet weak var signUpView: SignUpView!
    
    // MARK:- Properties
    private var viewModel:SignUpViewModelProtocol?
    
    //MARK:- LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.viewModel = SignUpViewModel(view: self)
        signUpView.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    
    // MARK:- Public Method
    class func create() -> SignUpVC {
        let signUpVC: SignUpVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: viewControllers.signUpVC)
        signUpVC.viewModel = SignUpViewModel(view: signUpVC)
        return signUpVC
    }
    
    //MARK:- IBActions
    
    @IBAction func signUpBtn(_ sender: IDEHospitalButton) {
        self.viewModel?.enterDataSignUp(name: signUpView.nameTxt.text ?? "" , email: signUpView.emailTxt.text ?? "" , mobile: signUpView.mobileTxt.text ?? "" , password: signUpView.passwordTxt.text ?? "" , confirmPassword: signUpView.confirmPassword.text ?? "" )
        sender.setupAnimatedBtn()
    }
    
    @IBAction func termsANdConditionBtn(_ sender: Any) {
        // go to termsANDConditionVC
    }
    
    //MARK:- private Methods 
    private func setupNav(){
        setupNavController()
        setViewControllerTitle(to: "SIGN UP")
        addSettingsButton()
        setupBackButton()
    }
    
}
// MARK:- Confirm Protocol
extension SignUpVC:SignUpVCProtocol{
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
        signUpView?.showLoading()
    }
    func hideLoader() {
        signUpView?.hideLoading()
    }
}
