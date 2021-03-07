//
//  SearchViewController.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationStyle()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK:- Public Methods
    class func create() -> SearchViewController {
        let searchViewController: SearchViewController = UIViewController.create(storyboardName: Storyboards.mainTabBar, identifier: ViewControllers.searchViewController)
//        homeVC.homeViewModel = HomeViewModel(homeVC: homeVC)
        return searchViewController
    }



}
