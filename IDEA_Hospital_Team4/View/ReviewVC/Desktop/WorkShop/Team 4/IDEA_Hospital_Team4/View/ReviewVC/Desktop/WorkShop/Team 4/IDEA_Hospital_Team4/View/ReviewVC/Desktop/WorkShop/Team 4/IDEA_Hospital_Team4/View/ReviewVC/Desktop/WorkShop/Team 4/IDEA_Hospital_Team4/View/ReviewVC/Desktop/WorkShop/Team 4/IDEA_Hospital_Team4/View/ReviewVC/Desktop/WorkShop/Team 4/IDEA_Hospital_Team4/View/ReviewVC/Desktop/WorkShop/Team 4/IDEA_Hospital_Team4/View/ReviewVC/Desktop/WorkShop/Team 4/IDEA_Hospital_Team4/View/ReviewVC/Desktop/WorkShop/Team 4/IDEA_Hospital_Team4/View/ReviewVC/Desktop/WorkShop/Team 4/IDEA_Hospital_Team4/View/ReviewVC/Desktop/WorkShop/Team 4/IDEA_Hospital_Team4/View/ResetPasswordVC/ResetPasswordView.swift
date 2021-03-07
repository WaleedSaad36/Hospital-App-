//
//  ResetPasswordView.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/5/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit

class ResetPasswordView: UIView {
    @IBOutlet var background: UIImageView!
    @IBOutlet var resetTextField: IDEHospitalTextField!
    @IBOutlet var resetBtn: IDEHospitalButton!
    
    func setUp () {
        self.layoutIfNeeded()
        setUpBackground()
        setUpTextFields()
        resetBtn.setup(title: "Set New Password")
        resetTextField.addImage(image: Asset.emailIcon.image)
        resetTextField.addLineView()
    }
}
extension ResetPasswordView{
    private func setUpBackground() {
        background.image = Asset.backGroundpicture.image
        background.contentMode = .scaleAspectFill
    }
    private func setUpTextFields() {
        setUpTextField(textField: resetTextField, text: "Enter Email", typeKeyboard: .email)
    }
    
    private func setUpTextField(textField: UITextField, text: String ,typeKeyboard:textFieldType){
        textField.textColor = .white
        textField.textAlignment = .left
        
        textField.attributedPlaceholder = NSAttributedString(string: text,attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 15)])
        
        //self.layer.masksToBounds = true
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
