//
//  HomeNurseVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/13/20.
//

import UIKit

// MARK:- Protocols
protocol NurseVCProtocol: class {
    func hideLoader()
    func showLoader()
    func showAlert(img: UIImage , massage: String)
    func sendNurseView()->NurseView
    func successAlert(massage: String)
}

class NurseVC: UIViewController, UITextViewDelegate {
    
    // MARK: - Properties
    private var viewModel: NurseViewModelProtocol!
    
    // MARK:- Outlets
    @IBOutlet var nurseView: NurseView!
    var viewNurse: NurseView?
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nurseView.setup()
        nurseView.detailsTextField.delegate = self
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        if viewModel.returnContact() == true {
            setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.contactUs)
        }
        else {
            setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.nevNurse)
        }
    }
    // MARK:- TextField Methods
    func textViewDidChange(_ textView: UITextView) {
        if nurseView.detailsTextField.text.count == 0 {
            nurseView.textLabel.isHidden = false
        }
        else {
            nurseView.textLabel.isHidden = true
        }
    }
    
    // MARK:- Button Methods
    
    @IBAction func sendBtn(_ sender: UIButton) {
        viewModel.tryToNurseRequst(name: nurseView.nameTextfield.text!, email: nurseView.emailTextField.text!, mobile: nurseView.mobileNumTextFiled.text!, message: nurseView.detailsTextField.text ?? "")
    }
    // MARK:- navigation Methods
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func settingBtnTapped(){
        let setting = SettingVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    
    // MARK:- Public Methods
    class func create(checkContact: Bool) -> NurseVC {
        let nurseVC: NurseVC = UIViewController.create(storyboardName: Storyboards.nurse, identifier: ViewControllers.nurseVC)
        nurseVC.viewModel = NurseViewModel(view: nurseVC, checkContact: checkContact)
        return nurseVC
    }
    
    
}
// MARK: - Implement Protocols
extension NurseVC: NurseVCProtocol{
    func successAlert(massage: String) {
        let alertPayload = AlertPayload(img: Asset.successAlert.image,message: massage) {
            AppDelegate.shared().switchToHomwState()
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    
    func showAlert(img: UIImage, massage: String) {
        let alertPayload = AlertPayload(img:img,message: massage) {
            self.dismiss(animated: true, completion: nil)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    
    func sendNurseView() -> NurseView {
        return viewNurse ?? self.view as! NurseView
    }
   
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
    
}
