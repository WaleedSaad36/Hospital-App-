//
//  EditProfileVC.swift
//  IDE Hospital
//
//  Created by Elshaer on 10/18/20.
//

import UIKit

protocol EditProfileVCProtocol: class {
    func showLoader()
    func hideLoader()
    func showAlert(message: String)
    func setUserData(user: Register)
    func showSuccess(with message: String)
}

class EditProfileVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var editProfileView: EditProfileView!
    
    // MARK: - Properties
    var viewModel: EditProfileViewModelProtocol!
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileView.setup()
        viewModel.getUserData()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    // MARK:- Public Methods
    class func create() -> EditProfileVC {
        let editProfileVC: EditProfileVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: "\(EditProfileVC.self)")
        editProfileVC.viewModel = EditProfileViewModel(view: editProfileVC)
        return editProfileVC
    }
    
    // MARK:- Actions
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        viewModel.getUserData(name: editProfileView.nameTextField.text,
                              email: editProfileView.emailTextField.text,
                              mobile: editProfileView.phoneTextField.text,
                              password: editProfileView.newPasswordTextField.text,
                              confrimPassword: editProfileView.confirmPasswordTextField.text,
                              oldPassword: editProfileView.oldPasswordTextField.text)
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK:- Private Methods
    private func setupNav(){
        setupNavController()
        setupBackButton()
        setBackgroungImage()
        setViewControllerTitle(to: "Edit Profile")
        tabBarController?.tabBar.isHidden = true
    }
}

//MARK:- Conform Protocol
extension EditProfileVC: EditProfileVCProtocol {
    func setUserData(user: Register) {
        editProfileView?.setData(user: user)
    }
    func showLoader() {
        editProfileView?.showLoading()
    }
    func hideLoader() {
        editProfileView?.hideLoading()
    }
    func showAlert(message: String) {
        self.showCustomAlert(type: .failButton, message: message, title: "OK", delgate: nil)
    }
    func showSuccess(with message: String) {
        
        self.showCustomAlert(type: .successButton, message: message, title: "OK", delgate: nil){
        self.dismiss(animated: true){
            AppRoot.createRoot()
        }
        }
    }
}
