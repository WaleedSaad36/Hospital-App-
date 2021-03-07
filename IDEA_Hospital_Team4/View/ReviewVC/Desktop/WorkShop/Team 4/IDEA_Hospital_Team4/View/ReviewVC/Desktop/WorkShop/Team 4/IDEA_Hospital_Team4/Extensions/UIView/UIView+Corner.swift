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
}
