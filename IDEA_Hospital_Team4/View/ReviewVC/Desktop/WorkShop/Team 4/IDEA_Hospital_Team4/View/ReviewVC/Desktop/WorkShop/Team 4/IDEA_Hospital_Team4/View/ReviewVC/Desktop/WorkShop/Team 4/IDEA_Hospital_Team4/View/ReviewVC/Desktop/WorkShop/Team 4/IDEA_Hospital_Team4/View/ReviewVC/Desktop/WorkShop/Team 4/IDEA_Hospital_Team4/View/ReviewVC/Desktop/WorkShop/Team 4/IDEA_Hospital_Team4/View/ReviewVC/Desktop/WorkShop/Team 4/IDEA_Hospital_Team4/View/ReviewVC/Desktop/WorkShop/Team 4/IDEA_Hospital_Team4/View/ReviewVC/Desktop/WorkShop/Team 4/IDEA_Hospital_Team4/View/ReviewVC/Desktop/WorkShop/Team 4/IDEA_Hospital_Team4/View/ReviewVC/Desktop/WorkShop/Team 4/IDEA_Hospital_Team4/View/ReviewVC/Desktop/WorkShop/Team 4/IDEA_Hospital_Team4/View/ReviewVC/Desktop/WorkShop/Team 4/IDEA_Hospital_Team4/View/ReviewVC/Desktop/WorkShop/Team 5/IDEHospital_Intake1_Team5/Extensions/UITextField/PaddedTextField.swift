//
//  PaddedTextField.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/18/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class PaddedTextField: UITextField {
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rightBound = CGRect(x: bounds.size.width - 33, y: 17.2, width: 20, height: 11.4)
        return rightBound
    }

}
