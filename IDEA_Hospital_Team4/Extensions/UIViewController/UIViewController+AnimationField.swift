//
//  UIViewController+AnimationField.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/30/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
extension UIViewController {
        private func setupAnimatedFields(textField:UITextField, posionTextFields:positionTextField){
            switch posionTextFields {
            case .first:
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
                    textField.center.x += self.view.bounds.width
                    
                }, completion: nil)
            case .second:
                UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
                    textField.center.x += self.view.bounds.width
                }, completion: nil)
            case .third:
                UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
                    textField.center.x += self.view.bounds.width
                }, completion: nil)
            case .four:
                UIView.animate(withDuration: 0.5, delay: 0.4, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
                    textField.center.x += self.view.bounds.width
                }, completion: nil)
            case .five:
                UIView.animate(withDuration: 0.5, delay: 0.4, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
                   textField.center.x += self.view.bounds.width
                }, completion: nil)
            }
        }
    func setupAnimatedPostive(textFeild:UITextField, posionTextFields: positionTextField) {
            setupAnimatedFields(textField: textFeild , posionTextFields:posionTextFields )
            setupAnimatedFields(textField: textFeild, posionTextFields: posionTextFields)
            setupAnimatedFields(textField: textFeild, posionTextFields: posionTextFields)
            setupAnimatedFields(textField: textFeild, posionTextFields: posionTextFields)
            setupAnimatedFields(textField: textFeild, posionTextFields: posionTextFields)
        }
        
        func setupAnimatedNegative(textFeild:UITextField) {
            textFeild.center.x -= self.view.bounds.width
        }
        
    }
    
    extension UIViewController {
        enum positionTextField{
            case first,second,third,four,five
        }

}
