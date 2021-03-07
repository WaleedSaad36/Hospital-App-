//
//  SearchResultView.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/13/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class SearchView: UIView {

    // MARK:- Outlets
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var logoLabel1: UILabel!
    @IBOutlet weak var logoLabel2: UILabel!
    @IBOutlet weak var specialistsView: UIView!
    @IBOutlet var servicesTextFeild: [UITextField]!
    @IBOutlet weak var specicalistsImage: UIImageView!
    @IBOutlet weak var specialistsTextFeild: UITextField!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityTextFeild: UITextField!
    @IBOutlet weak var regionView: UIView!
    @IBOutlet weak var regionImage: UIImageView!
    @IBOutlet weak var regionTextFeild: UITextField!
    @IBOutlet weak var companiesView: UIView!
    @IBOutlet weak var companiesImage: UIImageView!
    @IBOutlet weak var companiesTextFeild: UITextField!
    @IBOutlet weak var doctorView: UIView!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorTextFeild: UITextField!
    @IBOutlet weak var findDoctorBtn: UIButton!
    
    // MARK: - Public Properties
    let placeholderArr = ["Choose Specialists", "Choose City", "Choose Region", "Choose Companies", "Doctor Name"]
    var picker  = UIPickerView()
    // toollbar
    let toolbar = UIToolbar()
    // bar button
    let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
    
    // MARK:- Public Methods
    func setupFullView() {
       // backGroundImage.image = Asset.component22.image
        setupView()
        setupPlaceholder()
        setupFindDoctorBtn()
        setupPicker()
        setupHomeLabel()
        settoolbar()
        setupLabel()
        setupTextFeilds()
    }
    
        func setupPlaceholder(){
        for tag in 0...4 {
        servicesTextFeild[tag].placeholder = placeholderArr[tag]
        }
        
    }
    private func setupHomeLabel(){
        logoLabel1.text = LabelText.ideaHospital
        logoLabel1.textColor = ColorName.white.color
        logoLabel1.textAlignment = .center
        logoLabel1.font = FontFamily.PTSans.bold.font(size: 40)
    }
    private func setupLabel(){
        logoLabel2.text = LabelText.homeLabel
        logoLabel2.textColor = ColorName.white.color
        logoLabel2.textAlignment = .center
        logoLabel2.font = FontFamily.PTSans.regular.font(size: 20)
    }

    func settoolbar () {
        toolbar.sizeToFit()
        //assign toolbar
        self.specialistsTextFeild.inputAccessoryView = toolbar
        self.regionTextFeild.inputAccessoryView = toolbar
        self.companiesTextFeild.inputAccessoryView = toolbar
        self.cityTextFeild.inputAccessoryView = toolbar
        toolbar.setItems([doneBtn], animated: true)
    }
    
    
    func setupView() {
        specialistsView.backgroundColor = ColorName.darkRoyalBlue.color
        specicalistsImage.image = Asset.companyIcon.image
        specialistsView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
        
        cityView.backgroundColor = ColorName.darkRoyalBlue.color
        cityImage.image = Asset.pin.image
        cityView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
        
        regionView.backgroundColor = ColorName.darkRoyalBlue.color
        regionImage.image = Asset.pin.image
        regionView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
        
        companiesView.backgroundColor = ColorName.darkRoyalBlue.color
        companiesImage.image = Asset.lifeWhite.image
        companiesView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
        
        doctorView.backgroundColor = ColorName.darkRoyalBlue.color
        doctorImage.image = Asset.doctor.image
        doctorView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
    }
    
    func setupTextFeilds () {
        specialistsTextFeild.backgroundColor = ColorName.white.color
        specialistsTextFeild.alpha = 0.80
        specialistsTextFeild.setRightImage(imageName: "arrow")
        specialistsTextFeild.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
    //  specialistsTextFeild.placeholder = "Choose Specialists"
        
        cityTextFeild.backgroundColor = ColorName.white.color
        cityTextFeild.alpha = 0.80
        cityTextFeild.setRightImage(imageName: "arrow")
        cityTextFeild.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
    // cityTextFeild.placeholder = "Choose City"
        
        regionTextFeild.backgroundColor = ColorName.white.color
        regionTextFeild.alpha = 0.80
        regionTextFeild.setRightImage(imageName: "arrow")
        regionTextFeild.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
   //   regionTextFeild.placeholder = "Choose Region"
        
        companiesTextFeild.backgroundColor = ColorName.white.color
        companiesTextFeild.alpha = 0.80
        companiesTextFeild.setRightImage(imageName: "arrow")
        companiesTextFeild.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
  //    companiesTextFeild.placeholder = "Choose Companies"
        
        doctorTextFeild.backgroundColor = ColorName.white.color
        doctorTextFeild.alpha = 0.80
        doctorTextFeild.placeholder = "Doctor Name"
        doctorTextFeild.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
    }
    
    func setupFindDoctorBtn() {
        findDoctorBtn.backgroundColor = ColorName.darkRoyalBlue.color
        findDoctorBtn.setTitle("Find a doctor", for: .normal)
        findDoctorBtn.setTitleColor(ColorName.white.color, for:.normal )
        findDoctorBtn.titleLabel?.font.withSize(20)
        findDoctorBtn.layer.cornerRadius = 10
    }
    
    func setupPicker() {

//         specialistsTextFeild.inputView = picker
//         cityTextFeild.inputView = picker
//         regionTextFeild.inputView = picker
//         companiesTextFeild.inputView = picker
        for tag in 0...3 {
        servicesTextFeild[tag].inputView = picker
        }
    }
    // MARK:- Action
    @objc func donePressed () {
        self.endEditing(true)
    }
}




