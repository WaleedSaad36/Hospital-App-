//
//  HomeNurseVC.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/19/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

protocol HomeNurseVCProtocol {
    func homeNurseview () -> HomeNurseView
}

class HomeNurseVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var homeNurseView: HomeNurseView!
    
    // MARK: - Public Properties
    weak var delegate: GetIdDelegate?
    var viewModel: HomeNurseViewModelProtocol!
    var home: HomeVC!
    private var id : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationStyle()
        self.homeNurseView.setupFullView()
        self.viewModel = HomeNurseViewModel(view: self)
        viewModel.nurseRequest()
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

// MARK:- Public Methods
class func create() -> HomeNurseVC {
    let homeNurseVC: HomeNurseVC = UIViewController.create(storyboardName: Storyboards.search, identifier: ViewControllers.homeNurseVC)
  //  homeNurseVC.viewModel = HomeViewModel(homeNurseVC: homeNurseVC)
    return homeNurseVC
}
    
}
extension HomeNurseVC: HomeNurseVCProtocol {
    func homeNurseview () -> HomeNurseView {
        return homeNurseView
    }
}

//extension HomeNurseVC: GetIdDelegate {
//    func getId(_ id: String){
//        self.id = id
//        print("5... id in nurse is \(id)")
//    }
//}
