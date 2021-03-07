//
//  SuccessBookVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import UIKit
struct AlertPayload {
    var img: UIImage?
    var message: String!
    var action: (() -> Swift.Void)? = nil
}
class SuccessBookVC: UIViewController {

    
    @IBOutlet var sccessBookView: SuccessBookView!
    var payload: AlertPayload!
    override func viewDidLoad() {
        super.viewDidLoad()
        sccessBookView.successMsg.text = payload.message
        sccessBookView.successImage.image = payload.img
        sccessBookView.updateUI()
    }
    //MARK:- CreateVC
    class func create() -> SuccessBookVC {
        let successVC: SuccessBookVC = UIViewController.create(storyboardName: Storyboards.SuccessBook, identifier: ViewControllers.SuccessBookVC)
        return successVC
    }
    
    @IBAction func okPressed(_ sender: Any) {
        self.payload.action?()
    }
    
  
}
