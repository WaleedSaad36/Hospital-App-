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
    var viewModel: HomeNurseViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeNurseView.setupFullView()
        self.viewModel = HomeNurseViewModel(view: self)
        viewModel.nurseRequest()
    }
}
    
extension HomeNurseVC: HomeNurseVCProtocol {
    func homeNurseview () -> HomeNurseView {
        return homeNurseView
    }
}
