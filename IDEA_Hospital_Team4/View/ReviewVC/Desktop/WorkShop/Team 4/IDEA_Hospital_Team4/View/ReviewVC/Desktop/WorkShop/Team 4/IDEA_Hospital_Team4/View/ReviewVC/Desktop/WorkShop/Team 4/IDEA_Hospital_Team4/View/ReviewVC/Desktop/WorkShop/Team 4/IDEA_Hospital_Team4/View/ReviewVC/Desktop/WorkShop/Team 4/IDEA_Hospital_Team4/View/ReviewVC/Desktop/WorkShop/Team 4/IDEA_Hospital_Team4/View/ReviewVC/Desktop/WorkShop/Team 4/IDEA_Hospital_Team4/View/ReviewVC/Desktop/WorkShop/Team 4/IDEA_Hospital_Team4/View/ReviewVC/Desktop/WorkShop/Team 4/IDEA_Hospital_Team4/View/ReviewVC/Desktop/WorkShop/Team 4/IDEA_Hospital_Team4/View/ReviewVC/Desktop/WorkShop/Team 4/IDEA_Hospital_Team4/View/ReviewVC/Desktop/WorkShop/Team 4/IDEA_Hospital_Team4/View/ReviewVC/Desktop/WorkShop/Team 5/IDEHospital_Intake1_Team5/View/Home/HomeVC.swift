//
//  HomeVC.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/7/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
//MARK:- Protocol
protocol HomeVCProtocol: class {
    func showErrorMsg(message: String)
    func showSuccessMsg(message: String)
    func presentNurseScreen(_ id: String)
    func presentSearchScreen(_ id: String)
    func processOnStart()
    func processOnStop()
    func setupServicesConfiguration()
    func setupServicesToViews()
    func confirmationAlert1(title: String,message: String)
    func showAlertWithTwoActions(title: String, message: String, firstBtn: UIAlertAction)
}
class HomeVC: UIViewController {
    // MARK:- Outlets
    @IBOutlet weak var homeView: HomeView!
    //MARK:- Properties
    weak var delegate: GetIdDelegate?
    var homeViewModel: HomeViewModelProtocol!
    var id: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.setup()
        navigationStyle()
        self.homeViewModel = HomeViewModel(homeVC: self)
        self.homeViewModel?.serviceOfGetAllMainCategories()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK:- Public Methods
    class func create() -> HomeVC {
        let homeVC: HomeVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.homeVC)
        homeVC.homeViewModel = HomeViewModel(homeVC: homeVC)
        return homeVC
    }

    @IBAction func chooseServicePressed(_ sender: UIButton) {
        let tag = sender.tag
        let item = self.homeViewModel.getIdArray
        self.id = item()[tag]
        UserDefaultsManager.shared().serviceID = item()[tag]
        let vc = SearchVC.create()
        vc.id = self.id
//        delegate?.getId(id)
        print("1- the doctore is \(sender.tag) \(id)")
        self.homeViewModel.goToNext(tag: tag, id: id )
    }
  func setupServicesFromService(){
            self.homeView.setupServicesToViews(mainCategoriesArray: (self.homeViewModel?.getMainCategoriesData())!)
    }
}
//MARK:- Extension
// Confirm protocol
extension HomeVC: HomeVCProtocol {
    
    func presentNurseScreen(_ id: String) {
        print("3..in go to nerse: \(id)")
        self.navigationController?.pushViewController(HomeNurseVC.create(), animated: true)
    }
    func presentSearchScreen(_ id: String) {
        print("3..in go to search: \(id)")
        self.navigationController?
            .present(MainTabBarController.create(), animated: true, completion: nil)
    }
    func setupServicesToViews() {
        self.homeView.setupServicesToViews(mainCategoriesArray: (self.homeViewModel.getMainCategoriesData()))
    }
    
    func setupServicesConfiguration() {
        self.homeView.setupServicesConfiguration()
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

extension HomeVC: GetIdDelegate {
    func getId() -> String {
        let id1 =  self.id
        print("4... id in nurse is \(id1)")
        return id1
    }
}
