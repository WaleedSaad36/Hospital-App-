//
//  UIView+Corner.swift
//  IDEA Hospital
//
//  Created by IDE Academy on 12/18/20.
//  Copyright © 2020 Yasser Aboibrahim. All rights reserved.
//

import UIKit
extension UIView{
    func cornerRadius() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    func cornerStylish(color : UIColor, borderWidth: CGFloat, cornerRadius : CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
        clipsToBounds = true
    }
}
