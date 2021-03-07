//
//  CustomSmallTextField.swift
//  IDEA Hospital
//
//  Created by Hossam Yasser on 1/8/21.
//  Copyright © 2021 Yasser Aboibrahim. All rights reserved.
//

import UIKit

class CustomSmallTextField: UITextField {
    
    // MARK:- Properties
    let padding = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }
    
    func addLineView(){
        let lineView = UIView()
        lineView.layoutIfNeeded()
        lineView.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 2)
        lineView.backgroundColor = .white
        self.addSubview(lineView)
    }
}

