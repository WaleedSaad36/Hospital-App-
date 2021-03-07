//
//  RequestView.swift
//  IDE Hospital
//
//  Created by Ibrahim El-geddawy on 10/20/20.
//

import UIKit

enum RequestType{
    case contactus
    case nurse
}

class RequestView: UIView {
    
    // MARK:- Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contactusLabel: UILabel!
    @IBOutlet weak var nameTextField: IDEHospitalTextField!
    @IBOutlet weak var emailTextField: IDEHospitalTextField!
    @IBOutlet weak var mobileTextField: IDEHospitalTextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var sendBtnOutlet: IDEHospitalButton!
    @IBOutlet weak var titleTopLabelContrain: NSLayoutConstraint!
    
    // MARK:- Public Methods
    func setup(type: RequestType){
        self.layoutIfNeeded()
        setupTextFields()
        setupTextView(type: type)
        setupButton(type: type)
        setupLabel(type: type)
    }
}

// MARK:- Private Methods
extension RequestView{
    private func setupTextFields(){
        nameTextField.addLineView()
        nameTextField.addImage(image: Asset.user.image)
        nameTextField.setupPlaceholder(text: "Your Name")
        
        emailTextField.addLineView()
        emailTextField.addImage(image: Asset.emailIcon.image)
        emailTextField.setupPlaceholder(text: "Your Email")
        
        mobileTextField.addLineView()
        mobileTextField.addImage(image: Asset.mobIcon.image)
        mobileTextField.setupPlaceholder(text: "Mobile Number")
        mobileTextField.keyboardType = .namePhonePad
    }
    private func setupLabel(type: RequestType){
        switch type {
        case .contactus:
            titleLabel.text = "Contact Us Description"
            contactusLabel.text = "For More information call: 19199"
            titleTopLabelContrain.constant = 32
        default:
            titleLabel.text = "Nurse Description"
            contactusLabel.isHidden = true
        }
        self.titleLabel.textColor = .white
        self.titleLabel.font = FontFamily.PTSans.regular.font(size: 12)
        self.titleLabel.numberOfLines = 0
        self.contactusLabel.textColor = .white
        self.contactusLabel.font = FontFamily.PTSans.regular.font(size: 12)
    }
    private func setupButton(type: RequestType){
        switch type {
        case .contactus:
            sendBtnOutlet.setup(title: "Send")
        default:
            sendBtnOutlet.setup(title: "Send Request")
        }
    }
    private func setupTextView(type: RequestType) {
        messageTextView.backgroundColor = .clear
        messageTextView.font = FontFamily.PTSans.bold.font(size: 15)
        messageTextView.textColor = .white
        messageTextView.cornerStylish(color: .white, borderWidth: 1, cornerRadius: 10)
        switch type {
        case .contactus:
            messageTextView.text = "Your Message"
        default:
            messageTextView.text = "Enter Details"
        }
    }
}
