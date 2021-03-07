//
//  UIViewController+BackgroundImage.swift
//  IDEA_Hospital_Team4
//
//  Created by Elshaer on 12/20/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit

extension UIViewController {
    func setBackgroungImage(){
        let backgroundImageView = UIImageView(frame: self.view.frame)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = Asset.backGroundpicture.image
        self.view.insertSubview(backgroundImageView, at: 0)
    }
}
