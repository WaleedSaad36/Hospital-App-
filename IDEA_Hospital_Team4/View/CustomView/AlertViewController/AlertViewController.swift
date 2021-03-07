//
//  AlertView.swift
//  IDEA Hospital
//
//  Created by IDE Academy on 1/12/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
protocol alertDelegate:class {
    func appointmentCancel()
    func bookingContinue()
}

enum AlertTypes{
    case confirmButton(timeStamp: Int ,docName: String)
    case twoButtons
    case successButton
    case failButton
    case defaultAlert(title: String)
    case defaultAlertTwoButtons(title: String)
}

class AlertViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var AlertView: AlertView!
    //MARK:- Properties
    var type: AlertTypes!
    var delegatePopUp: VoucharDelegate?
    weak var delegateAlert:alertDelegate?
    var message: String!
    var buttonTitle: String!
    var completion: (()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AlertView.setup(type: type,message: message, buttonTitle: buttonTitle)
    }

    //MARK:- Public Methods
    class func create(type: AlertTypes)->AlertViewController{
        let alertVC = AlertViewController()
        alertVC.type = type
        return alertVC
    }
    
    //MARK:- Actions
    @IBAction func confirmBtnTapped(_ sender: IDEHospitalButton) {
        
        self.delegatePopUp?.confirmTapped()
            dismissAlert()
    }

    @IBAction func noBtnTapped(_ sender: IDEHospitalButton) {
        self.dismissAlert()
    }
    
    @IBAction func yesBtnTapped(_ sender: IDEHospitalButton) {
        delegatePopUp?.cancelTapped()
        dismissAlert()
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        print("cancel tapped")
        showCustomAlert(type: .twoButtons, message: "", title: "Ok", delgate: self)
        
    }
    
    
    //MARK:- Private Methods
}
extension AlertViewController:VoucharDelegate{
    func voucharData(code: String, name: String) {
        
    }
    
    func confirmTapped() {
        
    }
    
    func cancelTapped() {
        let topVC = self.presentingViewController
        topVC?.dismiss(animated: true, completion: nil)
    }
    
   
    private func dismissAlert(){
     self.dismiss(animated: true, completion: nil)
    }
}
