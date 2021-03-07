//
//  SearchResulltVC.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/13/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
// MARK: - Protocol
protocol SearchVCProtocol {
    func searchview () -> SearchView
    func getId() -> String
}

class SearchVC: UIViewController{
    
    // MARK:- Outlets
    @IBOutlet var searchView: SearchView!
    
    // MARK: - Public Properties
    var viewModel: SearchViewModelProtocol!
    var cityId = 0
    var id: String?

    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        navigationStyle()
        searchView.setupFullView()
        setupPickerView()
        self.viewModel = SearchViewModel(view: self)
        self.viewModel?.getAllCategories()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        }
    class func create() -> SearchVC {
        let searchVC: SearchVC = UIViewController.create(storyboardName: Storyboards.mainTabBar, identifier: ViewControllers.searchVC)
        
        searchVC.viewModel = SearchViewModel(view: searchVC)
        return searchVC
    }

    // MARK:- Private Methods
    private func setupPickerView() {

        self.searchView.picker.dataSource = self
        self.searchView.picker.delegate = self
        
        self.searchView.specialistsTextFeild.delegate = self
        self.searchView.specialistsTextFeild.tag = 1
        
        self.searchView.cityTextFeild.delegate = self
        self.searchView.cityTextFeild.tag = 2
        
        self.searchView.regionTextFeild.delegate = self
        self.searchView.regionTextFeild.tag = 3
        
        self.searchView.companiesTextFeild.delegate = self
        self.searchView.companiesTextFeild.tag = 4
    }
    
   
    
    // MARK:- Action
    @IBAction func findDoctorBtnTapped(_ sender: UIButton) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(SearchResultVC.create(), animated: true)
    }
}

// MARK: - Picker view data source & delegate
extension SearchVC: UIPickerViewDelegate, UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        switch searchView.picker.tag {
        case 1:
            return viewModel.sendSpecialties().count
        case 2:
            return viewModel.sendCities().count
        case 3:
            return viewModel.sendCities()[cityId-1].regions.count
        case 4:
            return viewModel.sendCompanies().count
        default:
            break
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch searchView.picker.tag {
        case 1:
            return viewModel.sendSpecialties()[row].name
        case 2:
            return viewModel.sendCities()[row].name
        case 3:
            return viewModel.sendCities()[cityId-1].regions[row].name
        case 4:
            return viewModel.sendCompanies()[row].name
        default:
            break
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.searchView.picker.reloadAllComponents()
        switch searchView.picker.tag {
        case 1:
            return self.searchView.specialistsTextFeild.text = viewModel.sendSpecialties()[row].name
        case 2:
            cityId = viewModel.sendCities()[row].id
            return self.searchView.cityTextFeild.text = viewModel.sendCities()[row].name
        case 3:
            return self.searchView.regionTextFeild.text = viewModel.sendCities()[cityId-1].regions[row].name
        case 4:
            return self.searchView.companiesTextFeild.text = viewModel.sendCompanies()[row].name
        default:
            break
        }
    }
}
// MARK: - TextField delegate
extension SearchVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.searchView.picker.tag = textField.tag
        self.searchView.picker.reloadAllComponents()
        if textField == searchView.regionTextFeild {
            if searchView.cityTextFeild.text == ""{
               showAlert(message: "You Must Choose City First")
            }
        }
    }
}

extension SearchVC: SearchVCProtocol {
    func getId() -> String {
        let home = HomeVC.create()
        let id = home.id ?? ""
        print("in SearchVC getId : \(id)")
        self.id = id
        return  id
    }
    
    func searchview () -> SearchView {
        return searchView
    }
}
