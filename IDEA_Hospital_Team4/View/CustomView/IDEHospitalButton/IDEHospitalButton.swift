//
//  IDEHospitalButton.swift
//  IDE Hospital
//
//  Created by Elshaer on 10/15/20.
//

import UIKit

class IDEHospitalButton: UIButton {
    
    // MARK:- Public Methods
    func setup(title: String, fontSize: CGFloat = 20, font: FontConvertible = FontFamily.PTSans.bold) {
        setupRadius()
        setTitle(title, for: .normal)
        setupButtonColors()
        titleLabel?.font = font.font(size: fontSize)
        setupAnimatedBtn()
    }
    
    // MARK:- Private Methods
    private func setupRadius() {
        layoutIfNeeded()
        layer.cornerRadius = 10
    }
    
    private func setupButtonColors() {
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(hexString: "#001867")
    }
    func setupAnimatedBtn(){
    
        let pluse = CASpringAnimation(keyPath: "tranform.scale")
        pluse.duration = 0.6
        pluse.fromValue = 0.95
        pluse.toValue = 1
        pluse.autoreverses = true
        pluse.repeatCount = 2
        pluse.initialVelocity = 0.5
        pluse.damping = 1.0
        layer.add(pluse,forKey:nil)
    }
}
