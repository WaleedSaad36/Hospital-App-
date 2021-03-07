//
//  SignUpView.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/4/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    // MARK:- Outlets
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var nameTxt: IDEHospitalTextField!
    @IBOutlet weak var emailTxt: IDEHospitalTextField!
    @IBOutlet weak var mobileTxt: IDEHospitalTextField!
    @IBOutlet weak var passwordTxt: IDEHospitalTextField!
    @IBOutlet weak var confirmPassword: IDEHospitalTextField!
    @IBOutlet weak var SignupBtn: IDEHospitalButton!
    @IBOutlet weak var TermsLabel: UILabel!
    @IBOutlet weak var TermsBtn: UIButton!
    // MARK:- Properties
    
    // MARK:- Public Methods
    func setUp() {
        self.layoutIfNeeded()
        setUpBackground()
        setupTextFields()
        SignupBtn.setup(title: "Sign Up")
    }
    
    // MARK:- Private Methods
    
}

extension SignUpView{
    private func setUpBackground() {
        background.image = Asset.backGroundpicture.image
        background.contentMode = .scaleAspectFill
    }
    private func setupTextFields(){
        setUpTextField(textField: nameTxt, text: "Your Name", leftIcon: Asset.user.image, typeKeyboard: .name)
        setUpTextField(textField: emailTxt, text: "Your Email", leftIcon: Asset.emailIcon.image, typeKeyboard: .name)
        setUpTextField(textField: mobileTxt, text: "Mobile Number", leftIcon: Asset.mobIcon.image, typeKeyboard: .phone)
        setUpTextField(textField: passwordTxt, text: "Choose Password", leftIcon: Asset.lock.image, typeKeyboard: .password)
        setUpTextField(textField: confirmPassword, text: "Confirm Passowrd", leftIcon: Asset.lock.image, typeKeyboard: .password)
    }
    
    private func setUpTextField(textField:IDEHospitalTextField, text:String ,leftIcon: UIImage,typeKeyboard:textFieldType){
        textField.addLineView()
        textField.addImage(image: leftIcon)
        textField.attributedPlaceholder = NSAttributedString(string: text,attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 15)])
        
        self.layer.masksToBounds = true
        switch typeKeyboard {
        case .email:
            return textField.keyboardType = .emailAddress
        case .name:
            return textField.keyboardType = .default
        case .phone:
            return textField.keyboardType = .phonePad
        case .password:
            textField.isSecureTextEntry = true
            return textField.keyboardType = .default
        default:
            return textField.keyboardType = .default
        }
    }
}
extension SignUpVC{
    func setupAnimation() {
        setupAnimatedNegative(textFeild: self.signUpView.nameTxt)
        setupAnimatedNegative(textFeild: self.signUpView.emailTxt)
        setupAnimatedNegative(textFeild: self.signUpView.mobileTxt)
        setupAnimatedNegative(textFeild: self.signUpView.passwordTxt)
        setupAnimatedNegative(textFeild: self.signUpView.confirmPassword)
        setupAnimatedPostive(textFeild: signUpView.nameTxt, posionTextFields: .first)
        setupAnimatedPostive(textFeild: signUpView.emailTxt, posionTextFields: .second)
        setupAnimatedPostive(textFeild: signUpView.mobileTxt, posionTextFields: .third)
        setupAnimatedPostive(textFeild: signUpView.passwordTxt, posionTextFields: .four)
        setupAnimatedPostive(textFeild: signUpView.confirmPassword, posionTextFields: .five)
        
    }
}
