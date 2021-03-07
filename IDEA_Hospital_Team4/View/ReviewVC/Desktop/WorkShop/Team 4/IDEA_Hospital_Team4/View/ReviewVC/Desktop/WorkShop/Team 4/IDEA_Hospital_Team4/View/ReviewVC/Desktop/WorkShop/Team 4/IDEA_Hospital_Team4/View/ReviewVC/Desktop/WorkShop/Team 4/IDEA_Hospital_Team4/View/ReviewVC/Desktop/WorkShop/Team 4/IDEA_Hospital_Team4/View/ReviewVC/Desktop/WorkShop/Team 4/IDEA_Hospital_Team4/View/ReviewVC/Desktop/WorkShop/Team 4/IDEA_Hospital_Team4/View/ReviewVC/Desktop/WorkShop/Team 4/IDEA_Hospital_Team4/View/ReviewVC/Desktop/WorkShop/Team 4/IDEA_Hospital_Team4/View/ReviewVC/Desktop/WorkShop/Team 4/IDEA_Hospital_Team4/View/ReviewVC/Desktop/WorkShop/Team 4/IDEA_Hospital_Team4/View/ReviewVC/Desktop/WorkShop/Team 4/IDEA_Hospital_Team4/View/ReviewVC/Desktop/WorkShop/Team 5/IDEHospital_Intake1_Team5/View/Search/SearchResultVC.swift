//
//  SearchResult.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/19/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol SearchResultVCProtocol: class {
    func searchResultview () -> SearchResultView
    func processOnStart()
    func processOnStop()
    func noItemsConfiguration()
    func showErrorMsg(message: String)

}

class SearchResultVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var searchResultView: SearchResultView!
    
    // MARK: - Public Properties
    var viewModel: searchResultViewModelProtocol!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationStyle()
        self.searchResultView.noSearchResualtLabel.isHidden = true
        self.searchResultView.backgroundColor = .clear
        self.searchResultView.setup()
        self.setupTableView()
        self.setupPickerView()
        self.viewModel = SearchResultViewModel(view: self)
        viewModel.getAllDoctors()
    }
    class func create() -> SearchResultVC {
        let searchResultVC: SearchResultVC = UIViewController.create(storyboardName: Storyboards.search, identifier: ViewControllers.searchResultVC)
        
        searchResultVC.viewModel = SearchResultViewModel(view: searchResultVC)
        return searchResultVC
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK:- Private Methods
    private func setupPickerView() {

        self.searchResultview().picker.dataSource = self
        self.searchResultview().picker.delegate = self
    }
    
    private func setupTableView() {
        
        self.searchResultView.doctorsTabelView.dataSource = self
        self.searchResultview().doctorsTabelView.delegate = self
    }
}

// MARK: - Table view data source & delegate

extension SearchResultVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.doctorCell, for: indexPath) as! DoctorCell
//        else {
//            return UITableViewCell()
//        }
        let item = self.viewModel.sendDoctors()[indexPath.row]
        cell.setupDoctorCellData(object: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sendDoctors().count
    }
}

// MARK: - Picker View data source & delegate
extension SearchResultVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return searchResultview().pickerArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return searchResultview().pickerArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return searchResultview().filterTextFeild.text = searchResultview().pickerArr[row]
    }
    
    
    
}

// MARK: - Protocol Confirmation
extension SearchResultVC: SearchResultVCProtocol {
    func processOnStart(){
        self.view.processOnStart()
    }
    func processOnStop(){
        self.view.processOnStop()
    }

    func showErrorMsg(message: String){
        self.presentError(with: message)
    }

    func noItemsConfiguration() {
        
    }
    
    func searchResultview () -> SearchResultView {
        return searchResultView
    }
}


