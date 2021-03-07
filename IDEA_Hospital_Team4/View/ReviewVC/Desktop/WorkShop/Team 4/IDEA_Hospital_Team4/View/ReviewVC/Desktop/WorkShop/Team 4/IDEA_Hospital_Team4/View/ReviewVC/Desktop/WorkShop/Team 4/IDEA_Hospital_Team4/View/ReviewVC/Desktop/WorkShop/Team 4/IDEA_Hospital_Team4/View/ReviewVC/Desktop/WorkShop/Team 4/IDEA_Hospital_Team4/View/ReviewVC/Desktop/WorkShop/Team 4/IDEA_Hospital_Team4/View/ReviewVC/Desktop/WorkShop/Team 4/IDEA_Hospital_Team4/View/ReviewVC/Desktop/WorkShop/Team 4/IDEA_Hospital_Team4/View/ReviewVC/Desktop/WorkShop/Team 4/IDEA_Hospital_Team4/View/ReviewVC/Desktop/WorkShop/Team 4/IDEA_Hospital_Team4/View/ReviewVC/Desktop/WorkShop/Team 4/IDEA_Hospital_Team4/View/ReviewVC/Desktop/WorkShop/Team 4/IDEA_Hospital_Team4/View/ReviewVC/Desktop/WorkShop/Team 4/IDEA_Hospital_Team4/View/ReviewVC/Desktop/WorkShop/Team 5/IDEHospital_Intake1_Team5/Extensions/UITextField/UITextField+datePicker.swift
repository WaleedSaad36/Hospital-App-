//
//  UITextField+extension.swift
//  TODOApp-MVC-Demo
//
//  Created by AbeerSharaf on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit
extension UITextField {
        func datePicker<T>(target: T,
                           doneAction: Selector,
                           cancelAction: Selector,
                           datePickerMode: UIDatePicker.Mode = .date) {
            let screenWidth = UIScreen.main.bounds.width
            
            func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
                let buttonTarget = style == .flexibleSpace ? nil : target
                let action: Selector? = {
                    switch style {
                    case .cancel:
                        return cancelAction
                    case .done:
                        return doneAction
                    default:
                        return nil
                    }
                }()
                
                let barButtonItem = UIBarButtonItem(barButtonSystemItem: style,
                                                    target: buttonTarget,
                                                    action: action)
                
                return barButtonItem
            }
            
            let datePicker = UIDatePicker(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: screenWidth,
                                                        height: 216))
            datePicker.datePickerMode = datePickerMode
            self.inputView = datePicker
            
            let toolBar = UIToolbar(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: screenWidth,
                                                  height: 44))
            toolBar.setItems([buttonItem(withSystemItemStyle: .cancel),
                              buttonItem(withSystemItemStyle: .flexibleSpace),
                              buttonItem(withSystemItemStyle: .done)],
                             animated: true)
            self.inputAccessoryView = toolBar
        }
    func setRightImage(imageName:String) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 11.4))
        imageView.image = UIImage(named: imageName)
        self.rightView = imageView;
        self.rightViewMode = .always
    }
    }
