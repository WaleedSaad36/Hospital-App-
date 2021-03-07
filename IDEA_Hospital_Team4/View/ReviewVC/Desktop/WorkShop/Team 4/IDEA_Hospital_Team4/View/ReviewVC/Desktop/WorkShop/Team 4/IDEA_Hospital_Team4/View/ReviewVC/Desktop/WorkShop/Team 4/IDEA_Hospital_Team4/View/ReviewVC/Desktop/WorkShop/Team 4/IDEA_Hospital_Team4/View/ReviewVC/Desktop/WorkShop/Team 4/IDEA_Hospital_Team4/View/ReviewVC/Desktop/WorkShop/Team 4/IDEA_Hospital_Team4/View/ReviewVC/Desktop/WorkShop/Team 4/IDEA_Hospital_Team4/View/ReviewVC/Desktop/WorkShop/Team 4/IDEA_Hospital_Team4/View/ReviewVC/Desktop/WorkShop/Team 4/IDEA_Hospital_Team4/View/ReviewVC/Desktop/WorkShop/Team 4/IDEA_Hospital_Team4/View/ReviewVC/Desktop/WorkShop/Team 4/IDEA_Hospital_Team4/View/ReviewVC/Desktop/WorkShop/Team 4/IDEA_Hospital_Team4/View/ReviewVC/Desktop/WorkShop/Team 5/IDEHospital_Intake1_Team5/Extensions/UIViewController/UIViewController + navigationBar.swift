//
//  UIViewController + navigationBar.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/14/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
extension UIViewController {
    func navigationStyle(){
        // NavBar Appearance
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        // Remove shadow
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = ColorName.pinkishGrey.color
        let textAttributes = [NSAttributedString.Key.foregroundColor:ColorName.white.color]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = ColorName.steelGrey.color
    }
    func setScreenTitle(screenTitle :String , fontColor : UIColor = ColorName.white.color){
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 25))
        title.font = FontFamily.PTSans.bold.font(size: 20)
        title.textAlignment = .center
        title.text = screenTitle
        title.textColor = fontColor
        self.navigationItem.titleView = title        
    }
}
