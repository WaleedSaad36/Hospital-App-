//
//  UITextFieldWithIcon+UnderLine.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/31/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

extension UITextField {

    func textFieldWithIcon (placholder : String ,icon :String) {
        
        // border
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = ColorName.white.color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        
        // placholder
        self.attributedPlaceholder = NSAttributedString(string: placholder, attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 14.0)
        ])
        
        // Text
        self.textColor = ColorName.white.color
        
        // Left Icon
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        imageView.image = UIImage(named: icon)
        self.leftView = imageView;
        self.leftViewMode = .always
        

    }

}
