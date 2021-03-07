//
//  LoginVC.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/6/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
//MARK:- Protocol LoginVC
protocol LoginVCProtocol {
    func showAlert(message: String)
    func showAlertFailure(messege: String)
    func showAlertSuccessfully(messege: String)
    func showLoader()
    func hideLoader()
    func goToMainHome()
    
}

class LoginVC: UIViewController {
    
    //MARK:- OutLets
    
    @IBOutlet var loginView: LoginView!
    
    
    
    //MARK:- Private Properties
    private var viewModel:loginViewModelProtocol?
    
    
    //MARK:- LifeCycly Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LoginViewModel(view: self)
        loginView.setUp()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    
    class func create() -> LoginVC {
        let loginVC: LoginVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: viewControllers.loginVC)
        return loginVC
    }

    //MARK:- IBAction Btn
    @IBAction func signInBtn(_ sender: Any) {
        self.viewModel?.enterDataLogin(email: loginView.emailTxt.text ?? "", password: loginView.passwordTxt.text ?? "")
        //goToMainHome()
        
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        goToResetPasswordVc()
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        goToSignUpVC()
    }
    
    //MARK:- private Methods
    
    private func setupNav(){
        setupNavController()
        setViewControllerTitle(to: "Login")
        addSettingsButton()
        setupBackButton()
    }
    
    private func goToResetPasswordVc(){
        let resetPasswordVC = ResetPasswordVC.create()
        self.navigationController?.pushViewController(resetPasswordVC, animated: true)
    }
    
    private func goToSignUpVC(){
        let signUpVC = SignUpVC.create()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
extension LoginVC:LoginVCProtocol{
    func goToMainHome() {
        let mainHome = MainVC.create()
        self.navigationController?.present(mainHome, animated: true, completion: nil)
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
        loginView?.showLoading()
    }
    func hideLoader() {
        loginView?.hideLoading()
    }
    
}
