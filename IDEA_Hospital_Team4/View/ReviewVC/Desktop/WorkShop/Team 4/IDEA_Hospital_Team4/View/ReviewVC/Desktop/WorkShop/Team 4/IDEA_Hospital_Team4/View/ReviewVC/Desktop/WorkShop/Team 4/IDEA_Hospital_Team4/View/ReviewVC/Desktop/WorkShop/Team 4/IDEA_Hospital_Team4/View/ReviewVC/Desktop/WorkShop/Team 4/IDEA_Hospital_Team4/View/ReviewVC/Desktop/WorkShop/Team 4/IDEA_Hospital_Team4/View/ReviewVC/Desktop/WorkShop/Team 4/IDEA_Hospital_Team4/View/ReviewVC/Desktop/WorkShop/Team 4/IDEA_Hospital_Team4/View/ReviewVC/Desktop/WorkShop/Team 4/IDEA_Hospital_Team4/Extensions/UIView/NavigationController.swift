//
//  NavigationController.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/15/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func setupNavController(title: String) {
        self.navigationItem.title = title
        self.navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.barTintColor = ColorName.veryLightPink.color
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : ColorName.white.color,
            NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 20) as Any
        ]
    }
    
}
