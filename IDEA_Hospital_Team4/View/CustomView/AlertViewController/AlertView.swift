//
//  AlertView.swift
//  IDEA Hospital
//
//  Created by IDE Academy on 1/12/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit

class AlertView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var alertImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var yesBtn: IDEHospitalButton!
    @IBOutlet weak var confirmBtn: IDEHospitalButton!
    @IBOutlet weak var noBtn: IDEHospitalButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    //MARK:- Public Methods
    func setup(type: AlertTypes,message: String, buttonTitle: String){
        self.layoutIfNeeded()
        setupType(type: type)
        setupContainerView()
        setupBtn(btnTitle: buttonTitle)
        titleAndMessageSetup(type: type, message: message)
        
    }
}

//MARK:- Extension Private Methods
extension AlertView{
    private func titleAndMessageSetup(type: AlertTypes, message: String){
        switch type{
        case .confirmButton(let timeStamp,let docName):
            setupConfirmMessage(timeStamp: timeStamp, docName: docName)
        case .defaultAlert(let title):
            setupTitleLabel(title: title)
            setupMessage(message: message)
        case .twoButtons:
            setupTitleLabel(title: "Are you sure you want to cancel this appointment?")
        case .defaultAlertTwoButtons(let title):
            setupTitleLabel(title: title)
        default:
            setupMessage(message: message)
        }
    }
    private func setupType(type: AlertTypes){
        switch type{
        case .defaultAlertTwoButtons:
            confirmBtn.isHidden = true
            yesBtn.isHidden = false
            noBtn.isHidden = false
            noBtn.backgroundColor = UIColor(red: 111.0 / 255.0, green: 4.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
            noBtn.setTitle("No", for: .normal)
            yesBtn.setTitle("Yes", for: .normal)
            alertImageView.isHidden = true
            cancelBtn.isHidden = true
            messageLabel.isHidden = true
        case .defaultAlert:
            confirmBtn.isHidden = false
            yesBtn.isHidden = true
            noBtn.isHidden = true
            alertImageView.isHidden = true
            alertImageView.contentMode = .scaleToFill
            cancelBtn.isHidden = true
            
        case .confirmButton:
            confirmBtn.isHidden = false
            cancelBtn.isHidden = false
            yesBtn.isHidden = true
            noBtn.isHidden = true
            alertImageView.isHidden = true
            cancelBtn.isHidden = false
            setupTitleLabel(title: "Confirm Your Appointment")
            
        case .successButton:
            confirmBtn.isHidden = false
            yesBtn.isHidden = true
            noBtn.isHidden = true
            alertImageView.image = Asset.right.image
            cancelBtn.isHidden = true
            
        case .failButton:
            confirmBtn.isHidden = false
            yesBtn.isHidden = true
            noBtn.isHidden = true
            alertImageView.image = Asset.worning.image
            alertImageView.contentMode = .scaleToFill
            cancelBtn.isHidden = true
            
        case .twoButtons:
            confirmBtn.isHidden = true
            yesBtn.isHidden = false
            noBtn.isHidden = false
            noBtn.backgroundColor = UIColor(red: 111.0 / 255.0, green: 4.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
            yesBtn.backgroundColor = UIColor(red: 111.0 / 255.0, green: 4.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
            noBtn.setTitle("No", for: .normal)
            yesBtn.setTitle("Yes", for: .normal)
            alertImageView.isHidden = true
            cancelBtn.isHidden = true
            messageLabel.isHidden = true
            yesBtn.layer.cornerRadius = yesBtn.frame.height / 4
            noBtn.layer.cornerRadius = yesBtn.frame.height / 4
        }
    }
    private func setupContainerView(){
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
    }
    
    private func setupTitleLabel(title: String ){
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.font = FontFamily.PTSans.bold.font(size: 15)
        
        titleLabel.sizeToFit()
        titleLabel.numberOfLines = 0
        
    }
    
    private func setupMessage(message: String){
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.textColor = UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
        messageLabel.font = FontFamily.PTSans.bold.font(size: 15)
         messageLabel.numberOfLines = 0
        messageLabel.sizeToFit()
       
    }
    
    private func setupConfirmMessage(timeStamp: Int, docName: String){
        messageLabel.textAlignment = .center
        messageLabel.textColor = .black
        messageLabel.font = FontFamily.PTSans.bold.font(size: 20)
        messageLabel.sizeToFit()
        messageLabel.numberOfLines = 0
        let boldAttribute = [
            NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 15)
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 15)
        ]
        let apiDate = Date(timeIntervalSinceNow: TimeInterval(timeStamp))
        let formatterDate = DateFormatter()
        let formatterTime = DateFormatter()
        formatterDate.dateFormat = "EEEE, MMM d, yyyy"
        formatterTime.dateFormat = "h:mm a"
        let boldText = NSAttributedString(string: "\(formatterDate.string(from: apiDate)).\(formatterTime.string(from: apiDate)) with \(docName)", attributes: boldAttribute)
        let regularText = NSAttributedString(string: " You are about to book an appointment on, ", attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(regularText)
        newString.append(boldText)
        messageLabel.attributedText = newString
    }
    
    private func setupBtn(btnTitle: String){
        confirmBtn.setup(title: btnTitle)
        noBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 15)
        yesBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 15)
    }
}
