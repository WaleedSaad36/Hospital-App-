//
//  HomeNurseVC.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 12/28/20.
//  Copyright © 2020 IOS. All rights reserved.

import UIKit
    //MARK:- Protocol Nurse VC
protocol HomeNurseVCProtocol: class {
    func goToMainHome()
    func showLoader()
    func hideLoader()
    func showAlert(messege: String)
    func showAlertSuccessfully(messege: String)
    func showAlertFailure(messege: String)
    
}

class HomeNurseVC: UIViewController {
    //MARK:- Outlets
    @IBOutlet var homeNurseView: HomeNurseView!
    
    //MARK:- private properties
    private var viewModel: HomeNurseViewModelProtocol?
    
    //MARK:- lifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.viewModel = homeNurseViewModel(view: self)
        self.homeNurseView.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
        setViewControllerTitle(to: "Home Nurse")
    }
    
    class func create() -> HomeNurseVC {
        let homeNurseVC: HomeNurseVC = UIViewController.create(storyboardName: Storyboards.homeNurse , identifier: viewControllers.homeNurseVC )
        homeNurseVC.viewModel = homeNurseViewModel(view: homeNurseVC)
        return homeNurseVC
    }
    //MARK:- IB Actions Btn
    @IBAction func SendRequestBtn(_ sender: Any) {
        self.viewModel?.sendDataHomeNurse(name: homeNurseView.nameTxt.text ?? "" , email: homeNurseView.emailTxt.text ?? "", mobile: homeNurseView.mobileTxt.text!, messege: homeNurseView.messegeTxt.text ?? "")
    }
    //MARK:- Private Methods
    
    private func setupNav(){
        setupNavController()
        setViewControllerTitle(to: "Home Nurse")
        addSettingsButton()
        setupBackTooRoot()
        tabBarController?.tabBar.isHidden = true
    }
}
    //MARK:- Confirm Protocol NurseVC

extension HomeNurseVC: HomeNurseVCProtocol{
    func showAlertFailure(messege: String) {
        showCustomAlert(type: .failButton, message: messege, title: "Ok", delgate: nil)
    }
    func showAlertSuccessfully(messege: String) {
        showCustomAlert(type: .successButton, message: messege, title: "OK", delgate: nil)
    }
    func goToMainHome() {
        navigationController?.popViewController(animated: true)
    }
    func showLoader() {
        self.view.showLoading()
    }
    func hideLoader() {
        self.view.hideLoading()
    }
    func showAlert(messege: String){
        showCustomAlert(type: .defaultAlert(title: "Sorry"), message: messege, title: "OK", delgate: nil)
    }
    
}
