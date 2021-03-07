//
//  DoctoreView.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/22/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class DoctorView: UIView {
    // MARK:- Outletss
    @IBOutlet weak var backgroundImageView: UIImageView!
// MARK:- Public Method
    func setup(){
        self.addBackground()
    }
}
// MARK:- Private Method
extension DoctorView {
    func addBackground(){
        backgroundImageView.image  = Asset.main.image
        backgroundImageView.contentMode = .scaleAspectFill
    }
}
