//
//  EditProfileView.swift
//  IDE Hospital
//
//  Created by Elshaer on 10/18/20.
//

import UIKit

class EditProfileView: UIView {

    // MARK:- Outlets
    @IBOutlet weak var nameTextField: IDEHospitalTextField!
    @IBOutlet weak var emailTextField: IDEHospitalTextField!
    @IBOutlet weak var phoneTextField: IDEHospitalTextField!
    @IBOutlet weak var oldPasswordTextField: IDEHospitalTextField!
    @IBOutlet weak var newPasswordTextField: IDEHospitalTextField!
    @IBOutlet weak var confirmPasswordTextField: IDEHospitalTextField!
    @IBOutlet weak var saveButton: IDEHospitalButton!
    @IBOutlet weak var cancelButton: IDEHospitalButton!
    @IBOutlet weak var contanierView: UIView!
    
    // MARK:- Public Methods
    func setup(){
        contanierView.layoutIfNeeded()
        setupTextFields()
        setupButtons()
    }
    func setData(user: Register) {
        nameTextField.text = user.name
        emailTextField.text = user.email
        phoneTextField.text = user.mobile
        oldPasswordTextField.text = "abcdABCD1234"
    }
    
    // MARK:- Private Methods
    private func setupTextFields(){
        nameTextField.addLineView()
        nameTextField.addImage(image: Asset.user.image)
        nameTextField.setupPlaceholder(text: "Your Name")
        
        emailTextField.addLineView()
        emailTextField.addImage(image: Asset.emailIcon.image)
        emailTextField.setupPlaceholder(text: "Your Email")
        
        phoneTextField.addLineView()
        phoneTextField.addImage(image: Asset.mobIcon.image)
        phoneTextField.setupPlaceholder(text: "Mobile Number")
        phoneTextField.keyboardType = .phonePad
        
        oldPasswordTextField.addLineView()
        oldPasswordTextField.addImage(image: Asset.lock.image)
        oldPasswordTextField.setupPlaceholder(text: "Old Password")
        oldPasswordTextField.isSecureTextEntry = true
        
        newPasswordTextField.addLineView()
        newPasswordTextField.addImage(image: Asset.lock.image)
        newPasswordTextField.setupPlaceholder(text: "Set New Password")
        newPasswordTextField.isSecureTextEntry = true
        
        confirmPasswordTextField.addLineView()
        confirmPasswordTextField.addImage(image: Asset.lock.image)
        confirmPasswordTextField.setupPlaceholder(text: "Confirm Password")
        confirmPasswordTextField.isSecureTextEntry = true
    }
    private func setupButtons(){
        saveButton.setup(title: "Save", fontSize: 15)
        cancelButton.setup(title: "Cancel", fontSize: 15)
        cancelButton.backgroundColor = UIColor(hexString: "#6f0066")
    }
}
