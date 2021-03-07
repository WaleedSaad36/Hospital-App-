//
//  HomeNurseView.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/19/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class HomeNurseView: UIView {

    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var sendRequestBtn: UIButton!
    
    
    
    func setupFullView() {
        backGroundImage.image = Asset.main.image
        textView.backgroundColor = UIColor.clear
        textView.textColor = ColorName.white.color
        textView.text = "If you would like further information about how we can help you and your helth it would be great to hear from you"
        
        detailsTextView.text = "Your Message "
        detailsTextView.backgroundColor = UIColor.clear
        detailsTextView.layer.cornerRadius = 10
        detailsTextView.layer.borderWidth = 1
        detailsTextView.layer.borderColor = ColorName.white.color.cgColor
        detailsTextView.layer.opacity = 1
        detailsTextView.textColor = ColorName.white.color
        setuptextFields()
        sendRequestBtnBtn()
    }
    
    func setuptextFields() {
        nameTextField.textFieldWithIcon(placholder: "Your Name", icon: "Component 11 – 1")
        emailTextField.textFieldWithIcon(placholder: "Your Email", icon: "component181")
        mobileTextField.textFieldWithIcon(placholder: "Mobile Number", icon: "component171")
    }
    
    func sendRequestBtnBtn() {
        sendRequestBtn.backgroundColor = ColorName.darkRoyalBlue.color
        sendRequestBtn.setTitle("Send Request", for: .normal)
        sendRequestBtn.setTitleColor(ColorName.white.color, for:.normal )
        sendRequestBtn.titleLabel?.font.withSize(20)
        sendRequestBtn.layer.cornerRadius = 10
    
    
}
}
extension UITextField {

    func underlined(){
            let border = CALayer()
            let width = CGFloat(2.0)
            border.borderColor = ColorName.white.color.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }

    func setLeftImage(imageName:String) {

            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = UIImage(named: imageName)
            self.leftView = imageView;
            self.leftViewMode = .always
        }
    
    
    }

    

