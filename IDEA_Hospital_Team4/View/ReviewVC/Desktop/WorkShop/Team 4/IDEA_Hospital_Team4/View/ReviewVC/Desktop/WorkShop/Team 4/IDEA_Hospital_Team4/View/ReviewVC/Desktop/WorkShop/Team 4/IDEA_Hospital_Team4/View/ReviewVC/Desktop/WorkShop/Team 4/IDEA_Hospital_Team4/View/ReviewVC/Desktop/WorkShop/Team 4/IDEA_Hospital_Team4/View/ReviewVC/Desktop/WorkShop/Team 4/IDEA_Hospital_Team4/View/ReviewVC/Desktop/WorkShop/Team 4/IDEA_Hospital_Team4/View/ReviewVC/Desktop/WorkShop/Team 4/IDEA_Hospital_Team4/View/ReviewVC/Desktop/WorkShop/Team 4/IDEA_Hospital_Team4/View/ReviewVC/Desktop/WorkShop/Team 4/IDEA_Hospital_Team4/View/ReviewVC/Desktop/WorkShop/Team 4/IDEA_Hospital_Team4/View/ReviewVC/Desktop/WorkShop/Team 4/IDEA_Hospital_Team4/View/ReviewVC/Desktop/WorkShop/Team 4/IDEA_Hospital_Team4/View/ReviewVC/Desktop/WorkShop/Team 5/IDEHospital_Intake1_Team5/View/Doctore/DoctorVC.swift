//
//  DoctoreVC.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/22/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class DoctorVC: UIViewController {
    // MARK:- Outlets
    @IBOutlet weak var doctorView: DoctorView!
    //MARK:- Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationStyle()
        self.doctorView.setup()
    }
    class func create() -> DoctorVC {
        let doctoreVC: DoctorVC = UIViewController.create(storyboardName: Storyboards.mainTabBar, identifier: ViewControllers.doctoreVC)
        return doctoreVC
    }
}
