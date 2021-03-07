//
//  MainTabBarController.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/16/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  tabBar.barTintColor = UIColor.clear
        
//        self.modalPresentationStyle = .overCurrentContext
//
//       // self.navigationController!.navigationBar.setBackgroundImage(Asset.main.image, for: .default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.isTranslucent = true

        navigationStyle()

        let searchViewController =  SearchVC.create()

        let myFavoritesVC =  MyFavoritesVC.create()

        
        let appointmentsVC =  AppointmentVC.create()
                
        
       
       let viewcontrollers = [searchViewController, myFavoritesVC, appointmentsVC ]
        viewControllers = viewcontrollers.map{
            UINavigationController(rootViewController: $0)
        }
        
        
        tabBar.items?[0].image = Asset.searchBar.image
        tabBar.items?[1].image = Asset.heartBar.image
        tabBar.items?[2].image = Asset.calendarBar.image
        
        
        tabBar.items?[0].title = "Search"
        tabBar.items?[1].title = "Favoraite"
        tabBar.items?[2].title = "Schedule"
        
        selectedViewController = viewControllers![0]
        selectedIndex = 0
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }

    class func create() -> MainTabBarController {
        let mainTabBarController: MainTabBarController = UIViewController.create(storyboardName: Storyboards.mainTabBar, identifier: ViewControllers.mainTabBarController)
        return mainTabBarController
    } 
}
