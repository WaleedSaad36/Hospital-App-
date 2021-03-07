//
//  SearchResultVC.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class SearchResultVC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationStyle()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }

    
    // MARK:- Public Methods
    class func create() -> SearchResultVC1 {
        let searchResultVC1: SearchResultVC1 = UIViewController.create(storyboardName: Storyboards.mainTabBar, identifier: ViewControllers.searchResultVC1)
        return searchResultVC1
    }


}
