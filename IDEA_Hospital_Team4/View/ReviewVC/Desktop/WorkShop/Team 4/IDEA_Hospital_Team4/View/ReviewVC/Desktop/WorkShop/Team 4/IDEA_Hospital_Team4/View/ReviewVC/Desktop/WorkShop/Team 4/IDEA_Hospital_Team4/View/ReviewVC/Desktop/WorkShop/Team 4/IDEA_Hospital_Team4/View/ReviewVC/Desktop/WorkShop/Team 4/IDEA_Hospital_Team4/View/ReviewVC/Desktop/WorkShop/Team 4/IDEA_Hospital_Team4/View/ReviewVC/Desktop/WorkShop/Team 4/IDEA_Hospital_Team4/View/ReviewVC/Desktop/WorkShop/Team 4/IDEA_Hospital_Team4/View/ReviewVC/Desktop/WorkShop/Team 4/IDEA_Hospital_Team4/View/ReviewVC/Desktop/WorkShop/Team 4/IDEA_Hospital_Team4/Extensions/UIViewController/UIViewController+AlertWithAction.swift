//
//  UIViewController+AlertWithAction.swift
//  IDEA Hospital
//
//  Created by yasser on 12/24/20.
//  Copyright © 2020 Yasser Aboibrahim. All rights reserved.
//

import UIKit

extension UIViewController {
    func showCustomAlert(type: AlertTypes, message: String, title: String, completion: (()->Void)? = nil,delgate:VoucharDelegate?){
        
        let alert = AlertViewController.create(type: type)
        alert.delegateAlert = delgate as? alertDelegate
        alert.delegatePopUp = delgate
        alert.message = message
        alert.buttonTitle = title
        alert.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        alert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        alert.completion = completion
        self.present(alert, animated: true, completion: nil)
    }
    
}
