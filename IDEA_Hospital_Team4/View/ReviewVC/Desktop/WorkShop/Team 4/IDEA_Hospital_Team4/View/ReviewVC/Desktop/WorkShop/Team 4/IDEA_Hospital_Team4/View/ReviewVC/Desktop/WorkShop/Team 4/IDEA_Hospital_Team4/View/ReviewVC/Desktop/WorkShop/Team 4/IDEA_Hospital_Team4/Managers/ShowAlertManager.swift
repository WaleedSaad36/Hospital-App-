//
//  ShowAlertManager.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/15/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit

class ShowAlertsManager{
    
    class func showAlertWithCancel(alertTitle: String,message: String,actionTitle: String){
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

