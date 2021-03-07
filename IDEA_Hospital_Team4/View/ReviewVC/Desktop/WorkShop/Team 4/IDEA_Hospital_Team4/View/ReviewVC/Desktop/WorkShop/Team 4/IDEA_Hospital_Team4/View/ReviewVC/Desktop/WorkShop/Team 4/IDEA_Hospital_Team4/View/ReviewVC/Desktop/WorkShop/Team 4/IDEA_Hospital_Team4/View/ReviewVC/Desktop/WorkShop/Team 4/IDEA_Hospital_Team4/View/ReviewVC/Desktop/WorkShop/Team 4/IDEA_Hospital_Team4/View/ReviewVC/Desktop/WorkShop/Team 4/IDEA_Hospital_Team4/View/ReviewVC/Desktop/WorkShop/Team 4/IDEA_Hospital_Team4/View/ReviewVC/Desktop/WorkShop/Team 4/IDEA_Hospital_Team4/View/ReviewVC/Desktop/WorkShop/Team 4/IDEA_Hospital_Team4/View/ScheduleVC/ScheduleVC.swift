//
//  ScheduleVC.swift
//  IDEA Hospital
//
//  Created by IDE Academy on 12/14/20.
//  Copyright © 2020 Yasser Aboibrahim. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    class func create() -> ScheduleVC {
        let scheduleVC: ScheduleVC = UIViewController.create(storyboardName: Storyboards.main, identifier: viewControllers.scheduleVC)
        return scheduleVC
        
    }
}
