//
//  SearchResultView.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/19/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class SearchResultView: UIView {

    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var doctorsTabelView: UITableView!
    @IBOutlet weak var sortView: UIView!
    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var noSearchResualtLabel: UILabel!

    @IBOutlet weak var filterTextFeild: UITextField!
    
    
    var pickerArr = ["Rate","Fees"]
    
    // Picker
    var picker  = UIPickerView()
    // toollbar
    let toolbar = UIToolbar()
    // bar button
    let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))

    // MARK:- Public Method
        func setup(){
            self.setupFullView()
            self.setupLabel()
            self.tableViewConfiguration()
            
        }
    }

// MARK:- Private Method
extension SearchResultView {
    private  func setupLabel(){
        noSearchResualtLabel.text = LabelText.noDataFoundLabel
        noSearchResualtLabel.textColor = ColorName.whiteTwo.color
        noSearchResualtLabel.font = FontFamily.PTSans.bold.font(size: 16)
    }

    func setupFullView() {
        backGroundImage.image = Asset.main.image
        setupFilter ()
        doctorsTabelView.backgroundColor = UIColor.clear
        backGroundImage.contentMode = .scaleAspectFill

    }
    private func tableViewConfiguration() {
        self.doctorsTabelView.register(UINib.init(nibName: Cells.doctorCell, bundle: nil), forCellReuseIdentifier: Cells.doctorCell)

        self.doctorsTabelView.separatorStyle = .none
        self.doctorsTabelView.rowHeight = UITableView.automaticDimension
        self.doctorsTabelView.isOpaque = false
        self.noSearchResualtLabel.isHidden = true
        self.doctorsTabelView.backgroundColor = .clear
        self.doctorsTabelView.reloadData()
    }
    func setupFilter () {
        sortView.backgroundColor = ColorName.darkRoyalBlue.color
        sortLabel.text = "Sort By"
        sortLabel.textColor = ColorName.white.color
        filterTextFeild.setRightImage(imageName: "wightArrow")
        filterTextFeild.textColor = ColorName.white.color
        setupPicker()
        settoolbar ()
    }
    
    func setupPicker() {
        filterTextFeild.inputView = picker
    }
    
    func settoolbar () {
        toolbar.sizeToFit()
        //assign toolbar
        self.filterTextFeild.inputAccessoryView = toolbar
        toolbar.setItems([doneBtn], animated: true)
    }
    
    // MARK:- Action
    @objc func donePressed () {
        self.endEditing(true)
    }
}
