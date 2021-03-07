//
//  MyFavoritesVCViewController.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/16/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
//MARK:- Protocol
protocol MyFavoritesVCProtocol: class {
    func showErrorMsg(message: String)
    func showSuccessMsg(message: String)
    func processOnStart()
    func processOnStop()
    func presentAlert()
    func reloadData()
    func deleteRows(_ indexPath: Int)
    func noItemsConfiguration()
    func confirmationAlert1(title: String,message: String)
    func showAlertWithTwoActions(title: String, message: String, firstBtn: UIAlertAction)
}
class MyFavoritesVC: UIViewController{
    // MARK:- Outlets
    @IBOutlet weak var myFavoriteView: MyFavoriteView!
    //MARK:- Properties
    var favoriteViewModel: FavoriteViewModelProtocol!
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationStyle()
        self.favoriteViewModel = FavoriteViewModel(myFavoritesVC: self)
        self.myFavoriteView.noFavoriteLabel.isHidden = true
        self.favoriteViewModel?.serviceOfGetAllFavorites()
        self.myFavoriteView.setup()
        self.setupTableView()
        self.myFavoriteView.backgroundColor = .clear
        //self.myFavoriteView.favoriteTableView.loadData(refresh: true)

    }
    override func viewWillAppear(_ animated: Bool) {
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }
    private func setupTableView(){
        // Add paginated delegates only
//        self.myFavoriteView.favoriteTableView.paginatedDelegate = self
//        self.myFavoriteView.favoriteTableView.paginatedDataSource = self

        self.myFavoriteView.favoriteTableView.dataSource = self
        self.myFavoriteView.favoriteTableView.delegate = self
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    class func create() -> MyFavoritesVC {
        let myFavoritesVC: MyFavoritesVC = UIViewController.create(storyboardName: Storyboards.mainTabBar, identifier: ViewControllers.myFavoritesVC)
        myFavoritesVC.favoriteViewModel = FavoriteViewModel(myFavoritesVC: myFavoritesVC)
        return myFavoritesVC
    }
}
    // MARK:- Table View Methods
    extension MyFavoritesVC : UITableViewDataSource , UITableViewDelegate,FavoritesCellDelegate {
        func deletePressButton(_ tag: Int) {
            let item = self.favoriteViewModel.getGetAllFavoritesItems()[tag]
            self.favoriteViewModel?.callDeleteService(item)
            self.reloadData()

        }
        
        func doctorProfilePressButton(_ tag: Int) {
            let item = self.favoriteViewModel.getGetAllFavoritesItems()[tag]
            showAlert(message: "the doctore is \(item.id) :  \(item.name)")
            self.reloadData()
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("array of favorite : \(self.favoriteViewModel.getGetAllFavoritesItems())")
            return self.favoriteViewModel.getGetAllFavoritesItems().count
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.favoritesResultTViewCell, for: indexPath) as! FavoritesAppointmentsTViewCell
            cell.delegate = self
            cell.viewProfileButton.tag = indexPath.row
            cell.deleteButton.tag = indexPath.row
            let item = self.favoriteViewModel.getGetAllFavoritesItems()[indexPath.row]
            cell.setupFavoriteCellData(object: item)
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 252
        }
    }
//MARK:- Extension
// Confirm protocol
extension MyFavoritesVC: MyFavoritesVCProtocol {
    func deleteRows(_ indexPath: Int) {
    }
    
    func reloadData() {
        self.myFavoriteView.favoriteTableView?.reloadData()
    }
    
    
    func presentAlert() {
    }
    
    
    
    func noItemsConfiguration() {
        self.myFavoriteView.noFavoriteLabel.isHidden = false
    }
  
    func confirmationAlert1(title: String,message: String){
        let okAction =  UIAlertAction(title: AlertActionTitle.yes, style: .default, handler: nil)
        self.confirmationAlert(title: title, message: message, firstBtn: okAction)
    }
    func showErrorMsg(message: String){
        self.presentError(with: message)
    }
    func showSuccessMsg(message: String){
        self.showAlert(message: message, title: AlertActionTitle.success)
    }
    func processOnStart(){
        self.view.processOnStart()
    }
    func processOnStop(){
        self.view.processOnStop()
    }
    func showAlertWithTwoActions(title: String, message: String, firstBtn: UIAlertAction){
        self.showCustomAlertWithAction(title: title, message: message, firstBtn: firstBtn)
    }
}
