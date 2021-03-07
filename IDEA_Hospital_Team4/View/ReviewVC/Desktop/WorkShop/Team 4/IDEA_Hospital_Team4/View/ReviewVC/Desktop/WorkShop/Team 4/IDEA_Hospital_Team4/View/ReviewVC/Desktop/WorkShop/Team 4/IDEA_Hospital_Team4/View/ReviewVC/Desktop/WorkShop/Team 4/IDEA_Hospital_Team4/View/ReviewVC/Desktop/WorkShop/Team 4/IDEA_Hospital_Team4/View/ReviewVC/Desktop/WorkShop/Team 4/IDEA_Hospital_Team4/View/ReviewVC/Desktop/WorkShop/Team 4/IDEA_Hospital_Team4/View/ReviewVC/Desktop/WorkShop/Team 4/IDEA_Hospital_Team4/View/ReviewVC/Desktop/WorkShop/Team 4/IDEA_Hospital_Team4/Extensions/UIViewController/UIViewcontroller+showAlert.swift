//
//  EX+showAlert.swift
//  IDEA Hospital
//
//  Created by IDE Academy on 12/13/20.
//  Copyright © 2020 Yasser Aboibrahim. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, okTitle: String = "OK", okHandler: ((UIAlertAction)->Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: okHandler))
        self.present(alert, animated: true, completion: nil)
}
    
}
