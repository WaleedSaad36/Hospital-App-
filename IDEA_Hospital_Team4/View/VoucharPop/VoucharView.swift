//
//  VoucharView.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/12/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit

class VoucharView: UIView {

    //MARK:- outlets
    //first outlets
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var firstTitle: UILabel!
    @IBOutlet weak var lineBlue: UIImageView!
    @IBOutlet weak var firstLabelYes: UILabel!
    @IBOutlet weak var voucharSwitch: UISwitch!
    @IBOutlet weak var firstLabelNo: UILabel!
    @IBOutlet weak var codeTxt: CustomTextField!
    //second Outlets
    @IBOutlet weak var secondTitle: UILabel!
    @IBOutlet weak var secondLabelYes: UILabel!
    @IBOutlet weak var bookingSwich: UISwitch!
    @IBOutlet weak var secondLabelNo: UILabel!
    @IBOutlet weak var nameTxt: CustomTextField!
    @IBOutlet weak var continueBtn: IDEHospitalButton!
    
    //MARK:- setUpMethod
    func setup() {
        self.layoutIfNeeded()
        self.layoutSubviews()
        setUpTextField(textField: codeTxt, text: "Enter Vouchar Code", typeKeyboard: .name)
        setUpTextField(textField: nameTxt, text: "Enter Patian Name", typeKeyboard: .name)
        continueBtn.setup(title: "Continue")
        setupLabelsSwitch()
        setupSwitch(nameSwitch: voucharSwitch)
        setupSwitch(nameSwitch: bookingSwich)
        view.layer.cornerRadius = 10
        view.sizeToFit()
        
    }
    
}
extension VoucharView{
    private func setupView(){
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
    }
    ///////// labels Switch ////////
    private func setupLabelSwitch(label: UILabel , text:String) {
        label.text = text
        label.font = FontFamily.PTSans.bold.font(size: 15)
        label.textColor = .black
        label.backgroundColor = .clear
        label.tintColor = .black
        label.textAlignment = .center
    }
    private func setupLabelsSwitch(){
    setupLabelSwitch(label: firstLabelNo, text: "Yes")
    setupLabelSwitch(label: secondLabelNo, text: "Yes")
    setupLabelSwitch(label: firstLabelYes, text: "No")
    setupLabelSwitch(label: secondLabelYes, text: "No")
    }
    
    /////////// switch //////
    private func setupSwitch(nameSwitch:UISwitch){
        switch nameSwitch.isOn {
            
        case true:
            nameSwitch.onTintColor =  UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
            nameSwitch.tintColor = UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
            nameSwitch.thumbTintColor = .white
            nameSwitch.layer.cornerRadius = 16
        case false:
            nameSwitch.onTintColor =  UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
            nameSwitch.tintColor = UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
            nameSwitch.thumbTintColor = .white
            nameSwitch.layer.cornerRadius = 16
        }
        
    }
    /////////labelTitle///////
    private func setupTitle(nameLabel: UILabel, text: String){
    nameLabel.text = text
        nameLabel.textColor = UIColor(red: 0.0, green: 24.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
        nameLabel.font = FontFamily.PTSans.bold.font(size: 15)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .clear
        nameLabel.sizeToFit()
    }
    ///////TextFeilds//////
    func setUpTextField(textField:CustomTextField,text:String,typeKeyboard:textFieldType){
        textField.backgroundColor = .clear
        textField.attributedPlaceholder = NSAttributedString(string: text,attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: FontFamily.PTSans.regular.font(size: 15)])
        textField.tintColor = .black
        textField.textColor = .black
        textField.layer.borderColor = UIColor(red: 0.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0).cgColor
        textField.layer.cornerRadius = textField.frame.height / 4
        textField.layer.borderWidth = 1
        
    }
}
