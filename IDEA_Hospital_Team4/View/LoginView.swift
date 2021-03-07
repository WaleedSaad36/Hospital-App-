//
//  LoginView.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/6/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit

class LoginView: UIView {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var emailTxt: IDEHospitalTextField!
    @IBOutlet weak var passwordTxt: IDEHospitalTextField!
    @IBOutlet weak var signInBtn: IDEHospitalButton!
    @IBOutlet weak var resetPasswordBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var firstLineView: UIImageView!
    @IBOutlet weak var secondLineView: UIImageView!
    
    func setUp() {
        self.layoutIfNeeded()
        setupTextFields()
        setUpBackground()
        setupButton(textReset: "Forget Password?", textSignup: "Sign Up")
        signInBtn.setup(title: "Login")
    }
}

extension LoginView{
    private func setUpBackground() {
        background.image = Asset.backGroundpicture.image
        background.contentMode = .scaleAspectFill
    }
    
    private func setupTextFields(){
      
        setUpTextField(textField: emailTxt, text: "Your Email", leftIcon: Asset.emailIcon.image, typeKeyboard: .name)
        setUpTextField(textField: passwordTxt, text: "Choose Password", leftIcon: Asset.lock.image, typeKeyboard: .password)
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
    private func setupButton( textReset: String, textSignup:String){
        // ResetButton
        resetPasswordBtn.setTitle(textReset, for: .normal)
        resetPasswordBtn.backgroundColor = .clear
        resetPasswordBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 15)
        resetPasswordBtn.titleLabel?.textAlignment = .center
        resetPasswordBtn.tintColor = .white
        
        // signUpButton
        signUpBtn.setTitle(textSignup, for: .normal)
        signUpBtn.backgroundColor = UIColor.init(red: 132.0 / 255.0, green: 133.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
        signUpBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
        signUpBtn.titleLabel?.textAlignment = .center
        signUpBtn.layer.cornerRadius = signUpBtn.frame.height / 10
        signUpBtn.tintColor = .white
        
    }
}
extension LoginVC {
    func setupAnimation(){
        setupAnimatedPostive(textFeild: loginView.emailTxt, posionTextFields: .first)
        setupAnimatedPostive(textFeild: loginView.passwordTxt, posionTextFields: .second)
        setupAnimatedNegative(textFeild: loginView.emailTxt)
        setupAnimatedNegative(textFeild: loginView.passwordTxt)
    }
}
