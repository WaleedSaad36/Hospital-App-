//
//  HomeNurseView.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 12/28/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit

class HomeNurseView: UIView, UITextViewDelegate {
    //MARK:- OutLets
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTxt: IDEHospitalTextField!
    @IBOutlet weak var emailTxt: IDEHospitalTextField!
    @IBOutlet weak var mobileTxt: IDEHospitalTextField!
    @IBOutlet weak var messegeTxt: UITextView!
    @IBOutlet weak var SentRequestBtn: IDEHospitalButton!
    
    //MARK:- SetUp Method
    func setUp(){
        self.layoutIfNeeded()
        setUpLabel()
        setupTextFields()
        setUpMessege()
        SentRequestBtn.setup(title: "Send Request")
        setUpBackground()
//        messegeTxt.returnKeyType = .done
//        messegeTxt.delegate = self
    }
   
}
    //MARK:- EX - Private Methods 
extension HomeNurseView{
    
    //---------setUpBackground-----
    private func setUpBackground(){
        background.image = Asset.backGroundpicture.image
        background.contentMode = .scaleAspectFill
    }
    
    //---------setup titleLabel--------
     private func setUpLabel(){
        
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = """
        If you would like further information about how we can help
        you and your health it would be great to hear from you
        """
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        titleLabel.sizeToFit()
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = UIColor.white
        titleLabel.font = FontFamily.PTSans.regular.font(size: 12)
        titleLabel.backgroundColor = .clear
    }
    //--------setupTextFields------
    private func setUpTextField(textField: IDEHospitalTextField, text:String ,leftIcon:UIImage,typeKeyboard: textFieldType){
        textField.textColor = .white
        textField.addImage(image: leftIcon)
        textField.addLineView()
        
        textField.attributedPlaceholder = NSAttributedString(string: text,attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 15)])
        
        switch typeKeyboard {
        case .email:
            return textField.keyboardType = .emailAddress
        case .name:
            return textField.keyboardType = .default
        case .phone:
            return textField.keyboardType = .phonePad
        default:
            return textField.keyboardType = .default
        }
            
        }
    
    private func setupTextFields(){
        setUpTextField(textField: nameTxt, text: "Your name", leftIcon: Asset.user.image, typeKeyboard: .name)
        setUpTextField(textField: emailTxt, text: "Your Email", leftIcon: Asset.emailIcon.image, typeKeyboard: .email)
        setUpTextField(textField: mobileTxt, text: "Mobile Number", leftIcon: Asset.mobIcon.image, typeKeyboard: .phone)
    }
    //----------SetUpMessege-----------
    private func setUpMessege(){
        //messegeTxt.text = "Enter Details"
        messegeTxt.attributedText = NSAttributedString(string: "Enter Detials",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 15)])
        messegeTxt.allowsEditingTextAttributes = true
        messegeTxt.textColor = .white
        messegeTxt.font = FontFamily.PTSans.bold.font(size: 15)
        messegeTxt.layer.cornerRadius = 10
        messegeTxt.backgroundColor = .clear
        messegeTxt.layer.borderWidth = 1.5
        messegeTxt.layer.borderColor = UIColor.white.cgColor
        messegeTxt.contentInset = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        messegeTxt.returnKeyType = .done
        messegeTxt.delegate = self
        
    }
    // MARK:- UITextViewDelegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Enter Detials"{
        textView.text = ""
        textView.textColor = .white
        textView.font = FontFamily.PTSans.bold.font(size: 15)
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "/n"{
            textView.resignFirstResponder()
            
        }
        return true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Enter Detials"
            textView.textColor = .white
            textView.font = FontFamily.PTSans.bold.font(size: 15)
        }
    }
    
}
extension UIView{
    enum textFieldType {
        case name , email , phone,password
    }
}
