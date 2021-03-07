//
//  UIViewController+Storyboard.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit

extension UIViewController {
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
