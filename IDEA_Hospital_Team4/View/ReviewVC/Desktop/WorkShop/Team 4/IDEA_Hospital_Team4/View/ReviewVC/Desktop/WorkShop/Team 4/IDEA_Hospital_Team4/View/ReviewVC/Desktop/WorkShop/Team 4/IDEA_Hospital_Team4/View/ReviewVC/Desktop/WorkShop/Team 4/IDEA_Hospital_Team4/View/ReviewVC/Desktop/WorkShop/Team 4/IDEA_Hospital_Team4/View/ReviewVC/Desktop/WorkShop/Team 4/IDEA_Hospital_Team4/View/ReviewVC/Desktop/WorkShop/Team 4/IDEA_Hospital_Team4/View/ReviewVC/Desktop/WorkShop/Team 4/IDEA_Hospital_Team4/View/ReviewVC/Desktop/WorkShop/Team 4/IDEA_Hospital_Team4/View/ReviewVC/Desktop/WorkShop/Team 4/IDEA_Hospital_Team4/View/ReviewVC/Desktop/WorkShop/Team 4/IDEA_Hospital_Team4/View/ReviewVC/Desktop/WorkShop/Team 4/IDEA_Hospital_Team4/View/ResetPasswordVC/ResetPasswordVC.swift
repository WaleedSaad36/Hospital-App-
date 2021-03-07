//
//  ResetPasswordVC.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/5/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
    //MARK:- Protocol ResetVC
protocol ResetPasswordVCProtocol:class {
    func showAlert(message: String)
    func showAlertFailure(messege: String)
    func showAlertSuccessfully(messege: String)
    func showLoader()
    func hideLoader()
}

class ResetPasswordVC: UIViewController {

    //MARK:- OutLets
    @IBOutlet var resetView: ResetPasswordView!
    
    //MARK:- private properties
    private var viewModel:ResetPasswordViewModelProtocol?
    
    //MARK:- lifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        resetView.setUp()
        self.viewModel = ResetPasswordViewModel(view: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    class func create() -> ResetPasswordVC {
        let resetPasswordVC: ResetPasswordVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: viewControllers.resetPasswordVC)
        resetPasswordVC.viewModel = ResetPasswordViewModel(view: resetPasswordVC )
        return resetPasswordVC
    }
    //MARK:- IB Actions Button
    @IBAction func ResetBtn(_ sender: Any) {
        self.viewModel?.resetForgottenPassword(email: resetView.resetTextField.text ?? "")
    }
    
    //MARK:- private Methods
    private func setupNav(){
        setupNavController()
        setViewControllerTitle(to: "RESET PASSWORD")
        addSettingsButton()
        setupBackButton()
    }
    
}
    //MARK:- Confirm Protocol VC
extension ResetPasswordVC : ResetPasswordVCProtocol{
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
        resetView?.showLoading()
    }
    func hideLoader() {
        resetView?.hideLoading()
    }
    
}
