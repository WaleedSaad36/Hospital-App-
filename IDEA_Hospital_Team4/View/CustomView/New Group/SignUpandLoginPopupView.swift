//
//  SignUpandLoginPopupView.swift
//  IDEA Hospital
//  IDEA Hospital
//
//  Created by IDE Academy on 1/14/21.
//  Copyright © 2021 IOS. All rights reserved.
//


import UIKit

class SignUpandLoginPopupView: UIView {
    
    //MARK:- Outlets
    
    //-------ContinarView------
    @IBOutlet weak var continarView: UIView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    //-------LoginView------
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailTextField: IDEHospitalTextField!
    @IBOutlet weak var passwordTextField: IDEHospitalTextField!
    @IBOutlet weak var checkVoucharBtn: UIButton!
    @IBOutlet weak var checkvoucharTxt: CustomSmallTextField!
    @IBOutlet weak var checkNameBtn: UIButton!
    @IBOutlet weak var checkNameTxt: CustomSmallTextField!
    @IBOutlet weak var voucharLabelCheck: UILabel!
    @IBOutlet weak var nameLabelCheck: UILabel!
    @IBOutlet weak var signInBtn: IDEHospitalButton!
    
    //-------RegisterView------
    
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var userNameTxt: IDEHospitalTextField!
    @IBOutlet weak var emailAddressTxt: IDEHospitalTextField!
    @IBOutlet weak var mobileTxt: IDEHospitalTextField!
    @IBOutlet weak var choosePasswordtxt: IDEHospitalTextField!
    @IBOutlet weak var firstCheckBoxBtn: UIButton!
    @IBOutlet weak var secondCheckBoxBtn: UIButton!
    @IBOutlet weak var voucharLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var voucharCodeTxt: CustomSmallTextField!
    @IBOutlet weak var patiantNameTxt: CustomSmallTextField!
    @IBOutlet weak var signUpBtn: IDEHospitalButton!
    
    
    //MARK:-  Setup
    func setup() {
        setUpBackground()
        registerBtnTapped()
        loginBtnTapped()
        signUpView.backgroundColor = .clear
        signUpView.isHidden = true
        setupTextField()
        loginView.backgroundColor = .clear
        signUpView.isHidden = false
        loginView.isHidden = true
        voucharCodeTxt.isUserInteractionEnabled = false
        patiantNameTxt.isUserInteractionEnabled = false
        checkvoucharTxt.isUserInteractionEnabled = false
        checkNameTxt.isUserInteractionEnabled = false
        registerBtn.backgroundColor = .white
        registerBtn.setTitleColor(UIColor(red: 0.0, green: 24.0/255.0, blue: 103.0/255.0, alpha: 1.0), for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        signInBtn.setup(title: "Login & Book")
        signUpBtn.setup(title: "Sign Up & Book")
        signInBtn.setupAnimatedBtn()
        signUpBtn.setupAnimatedBtn()
    }
}

//MARK:- private Methods
extension SignUpandLoginPopupView {
    private func setUpBackground(){
        background.image = Asset.backgroundPopUpAuth.image
        background.contentMode = .scaleToFill
        background.sizeToFit()
    }
    
    private func  registerBtnTapped(){
        registerBtn.backgroundColor = .clear
        registerBtn.titleLabel?.text = "Register"
        registerBtn.titleLabel?.font = UIFont(name: "PTSans-Bold", size: 20)
        registerBtn.layer.cornerRadius = registerBtn.frame.height / 16
    }
    
    func registerBtnPressed() {
        signUpView.isHidden = false
        loginView.isHidden = true
        registerBtn.backgroundColor = .white
        loginBtn.backgroundColor = .clear
        registerBtn.setTitleColor(UIColor(red: 0.0, green: 24.0/255.0, blue: 103.0/255.0, alpha: 1.0), for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
    }
    
    func loginBtnTapped(){
        loginBtn.backgroundColor = .clear
        loginBtn.titleLabel?.text = "Login"
        loginBtn.titleLabel?.font = UIFont(name: "PTSans-Bold", size: 20)
        loginBtn.layer.cornerRadius = loginBtn.frame.height / 16
        
    }
    
    func loginBtnPressed() {
        signUpView.isHidden = true
        loginView.isHidden = false
        loginBtn.backgroundColor = .white
        registerBtn.backgroundColor = .clear
        loginBtn.setTitleColor(UIColor(red: 0.0, green: 24.0/255.0, blue: 103.0/255.0, alpha: 1.0), for: .normal)
        registerBtn.setTitleColor(.white, for: .normal)
    }
    
    func setupTextField() {
        setUpTextField(textField: userNameTxt, text: "You Name", leftIcon: Asset.user.image, typeKeyboard: .name)
        
         setUpTextField(textField: emailAddressTxt , text: "You Email", leftIcon: Asset.emailIcon.image, typeKeyboard: .email)
         setUpTextField(textField: mobileTxt, text: "Moile Number", leftIcon: Asset.mobIcon.image, typeKeyboard: .phone)
        
         setUpTextField(textField: choosePasswordtxt, text: "Choose Password", leftIcon: Asset.lock.image, typeKeyboard: .password)
        
        voucharCodeTxt.addLineView()
        voucharCodeTxt.placeholder = "Enter Code"
        voucharCodeTxt.font = FontFamily.PTSans.regular.font(size: 17)
        voucharCodeTxt.tintColor = .white
        patiantNameTxt.addLineView()
        patiantNameTxt.placeholder = "Enter Name"
        patiantNameTxt.font = FontFamily.PTSans.regular.font(size: 17)
        setUpTextField(textField: emailTextField, text: "Your Email", leftIcon: Asset.emailIcon.image, typeKeyboard: .email)
        setUpTextField(textField: passwordTextField, text: "Choose Password", leftIcon: Asset.lock.image, typeKeyboard: .password)
        
        checkvoucharTxt.addLineView()
        checkvoucharTxt.placeholder = "Enter Code"
        checkvoucharTxt.font = FontFamily.PTSans.regular.font(size: 17)
        checkvoucharTxt.textColor = .white
        
        checkNameTxt.addLineView()
        checkNameTxt.placeholder = "Enter Name"
        checkNameTxt.font = FontFamily.PTSans.regular.font(size: 17)
        checkNameTxt.textColor = .white
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
    
    func loginDefault(){
        emailTextField.text! = ""
        checkNameTxt.text! = ""
        passwordTextField.text! = ""
        checkvoucharTxt.text! = ""
        checkNameBtn.setImage(Asset.checkBox.image, for: .normal)
        checkNameBtn.tintColor = .clear
        checkVoucharBtn.setImage(Asset.checkBox.image, for: .normal)
        checkVoucharBtn.tintColor = .clear
    }
    
    func registerDefault(){
        userNameTxt.text! = ""
        emailAddressTxt.text! = ""
        mobileTxt.text! = ""
        choosePasswordtxt.text! = ""
        voucharCodeTxt.text! = ""
        patiantNameTxt.text! = ""
        secondCheckBoxBtn.setImage(Asset.checkBox.image, for: .normal)
        firstCheckBoxBtn.setImage(Asset.checkBox.image, for: .normal)
        secondCheckBoxBtn.tintColor = .clear
        secondCheckBoxBtn.tintColor = .clear
    }
    
   
    func firstCheckBtnTapped()-> Bool{
        if firstCheckBoxBtn.tintColor == .white {
            firstCheckBoxBtn.setImage(Asset.rightRect.image, for: .normal)
            voucharCodeTxt.isUserInteractionEnabled = true
            voucharCodeTxt.isEnabled = true
            firstCheckBoxBtn.tintColor = UIColor.clear
            return true
        }else{
            firstCheckBoxBtn.setImage(Asset.checkBox.image, for: .normal)
            voucharCodeTxt.isUserInteractionEnabled = false
            voucharCodeTxt.text = ""
            firstCheckBoxBtn.tintColor = UIColor.white
            return false
        }
    }
    
    func secondCheckBtnTapped()-> Bool{
        if secondCheckBoxBtn.tintColor == UIColor.white {
            secondCheckBoxBtn.setImage(Asset.rightRect.image, for: .normal)
            patiantNameTxt.isUserInteractionEnabled = true
            secondCheckBoxBtn.tintColor = UIColor.clear
            return true
        }else{
            secondCheckBoxBtn.setImage(Asset.checkBox.image, for: .normal)
            patiantNameTxt.isUserInteractionEnabled = false
            patiantNameTxt.text = ""
            secondCheckBoxBtn.tintColor = UIColor.white
            return false
        }
    }
    
    func loginFirstCheckBtnTapped()-> Bool{
        if checkVoucharBtn.tintColor == UIColor.white {
            checkVoucharBtn.setImage(Asset.rightRect.image, for: .normal)
            checkvoucharTxt.isUserInteractionEnabled = true
            checkVoucharBtn.tintColor = UIColor.clear
            return true
        }else{
            checkVoucharBtn.setImage(Asset.checkBox.image, for: .normal)
            checkvoucharTxt.isUserInteractionEnabled = false
            checkvoucharTxt.text = ""
            checkVoucharBtn.tintColor = UIColor.white
            return false
        }
    }
    
    func loginSecondcheckBtnTapped()-> Bool{
        if checkNameBtn.tintColor == UIColor.white {
            checkNameBtn.setImage(Asset.rightRect.image, for: .normal)
            checkNameTxt.isUserInteractionEnabled = true
            checkNameBtn.tintColor = UIColor.clear
            return true
        }else{
            checkNameBtn.setImage(Asset.checkBox.image, for: .normal)
            checkNameTxt.isUserInteractionEnabled = false
            checkNameTxt.text = ""
            checkNameBtn.tintColor = UIColor.white
            return false
        }
    }
}
