//
//  UIViewController+showAlert.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/17/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Protocol
struct AlertableAction {
    var title: String
    var style: UIAlertAction.Style
    var result: Bool
}

protocol Alertable {
    func presentAlert(title: String?, message: String?, actions: [AlertableAction], completion: ((Bool) -> Void)?)
}
extension UIViewController {

    //MARK:- showAlert with action
    //  UIViewController+showAlert
    func presentAlert(title: String?, message: String?, actions: [AlertableAction], completion: ((Bool) -> Void)?) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { action in
            alertController.addAction(UIAlertAction(title: action.title, style: action.style, handler: { _ in completion?(action.result) }))
        }
        present(alertController, animated: true, completion: nil)
    }
    //MARK:- alert with text field
    public func alertWithTextField(title: String? = nil, message: String? = nil, placeholder: String? = nil, completion: @escaping ((String) -> Void) = { _ in }) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField() { newTextField in
            newTextField.placeholder = placeholder
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in completion("") })
        alert.addAction(UIAlertAction(title: "Save", style: .default) { action in
            if
                let textFields = alert.textFields,
                let tf = textFields.first,
                let result = tf.text
            { completion(result) }
            else
            { self.presentInfoMsg(with: "Enter you new\(String(describing: title?.lowercased()))")
                completion("")
            }
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- imagePickerController
    
    //MARK:- showAlert with actionSheet
    func presentAlertWithActionSheet(title: String?, message: String?, actions: [AlertableAction], completion: ((String) -> Void)?) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach { action in
            alertController.addAction(UIAlertAction(title: action.title, style: action.style, handler: { _ in completion?(action.title) }))
        }
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK:- showAlert
    func showAlert(message: String, title: String = "",okTitle: String = "OK", okHandler: ((UIAlertAction)-> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let oKAction = UIAlertAction(title: okTitle, style: .cancel, handler: okHandler)
        alert.addAction(oKAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showCustomActionSheet(sheetTitle : String,actionButtons : [UIAlertAction]){
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: ColorName.pinkishGrey.color]
        let titleString = NSAttributedString(string: sheetTitle , attributes: titleAttributes)
        
        alert.setValue(titleString, forKey: "attributedMessage")
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) {
            (UIAlertAction) in
        }
        alert.addAction(actionButtons[0])
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    func showCustomAlertWithAction(title: String,message: String,firstBtn : UIAlertAction) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(firstBtn)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func confirmationAlert(title: String,message: String,firstBtn : UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction =  UIAlertAction(title: "Yes", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @objc func presentError(with message: String) {
        self.showAlert(message: message, title: "Sorry")
    }
    
    @objc func presentSuccess(with message: String) {
        self.showAlert(message: message, title: "Success")
    }
    @objc func presentInfoMsg(with message: String) {
        self.showAlert(message: message)
    }
    
}
