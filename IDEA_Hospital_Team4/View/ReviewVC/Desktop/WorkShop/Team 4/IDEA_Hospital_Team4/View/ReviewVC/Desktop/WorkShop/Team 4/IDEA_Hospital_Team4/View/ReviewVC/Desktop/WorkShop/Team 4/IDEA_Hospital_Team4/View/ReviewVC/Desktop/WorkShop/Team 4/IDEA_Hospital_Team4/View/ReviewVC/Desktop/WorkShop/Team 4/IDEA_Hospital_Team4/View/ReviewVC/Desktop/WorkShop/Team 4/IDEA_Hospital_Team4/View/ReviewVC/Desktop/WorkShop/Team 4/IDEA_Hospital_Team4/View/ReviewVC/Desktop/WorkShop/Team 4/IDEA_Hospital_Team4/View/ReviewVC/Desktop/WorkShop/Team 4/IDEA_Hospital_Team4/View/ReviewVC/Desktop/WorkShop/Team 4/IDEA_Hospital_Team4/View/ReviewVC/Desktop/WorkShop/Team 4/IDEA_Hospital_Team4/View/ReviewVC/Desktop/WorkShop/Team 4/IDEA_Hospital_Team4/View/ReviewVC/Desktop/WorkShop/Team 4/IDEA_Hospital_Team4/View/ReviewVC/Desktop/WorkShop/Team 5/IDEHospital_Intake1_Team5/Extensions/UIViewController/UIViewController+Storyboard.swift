//
//  UIViewController+Storyboard.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/17/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    // UIViewController+Storyboard
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
