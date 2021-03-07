//
//  ServicesSearchView.swift
//  IDE Hospital
//
//  Created by Elshaer on 10/18/20.
//

import UIKit

enum FontType {
    case bold
    case regular
}

class ServicesSearchView: UIView {
  
    // MARK:- Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var specialistsView: UIView!
    @IBOutlet weak var specialistsTextField: UITextField!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var regionView: UIView!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var companiesView: UIView!
    @IBOutlet weak var companiesTextField: UITextField!
    @IBOutlet weak var doctorView: UIView!
    @IBOutlet weak var doctorTextField: UITextField!
    @IBOutlet weak var findDoctorBtnOutlet: IDEHospitalButton!
    
    // MARK:- Public Methods
    func setup(){
        setupLabel(label: titleLabel, text: "IDEA EG Hospital", fontType: .bold)
        setupLabel(label: subTitleLabel, text: "IDEA EG HOSPITAL THE BEST CHOICE", fontType: .regular)
        setupView(view: specialistsView)
        setupView(view: cityView)
        setupView(view: regionView)
        setupView(view: companiesView)
        setupView(view: doctorView)
        findDoctorBtnOutlet.setup(title: "Find A Doctor")
        setupTextField(textField: specialistsTextField, text: "Choose Specialists")
        setupTextField(textField: cityTextField, text: "Choose City")
        setupTextField(textField: regionTextField, text: "Choose Region")
        setupTextField(textField: companiesTextField, text: "Choose Companies")
        setupTextField(textField: doctorTextField, text: "Doctor Name")
    }
    
    // MARK:- Private Methods
    private func setupLabel(label: UILabel, text: String, fontType: FontType){
        label.text = text
        label.textColor = .white
        if fontType == .bold {
            label.font = FontFamily.PTSans.bold.font(size: 40)
        } else {
            label.font = FontFamily.PTSans.regular.font(size: 20)
        }
    }
    private func setupTextField(textField: UITextField, text: String){
        textField.backgroundColor = .white
        textField.font = FontFamily.PTSans.regular.font(size: 20)
        textField.attributedPlaceholder = NSAttributedString(string: text,
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    private func setupView(view: UIView){
        view.backgroundColor = UIColor(hexString: "#001867")
        view.layer.cornerRadius = 10
    }
}
