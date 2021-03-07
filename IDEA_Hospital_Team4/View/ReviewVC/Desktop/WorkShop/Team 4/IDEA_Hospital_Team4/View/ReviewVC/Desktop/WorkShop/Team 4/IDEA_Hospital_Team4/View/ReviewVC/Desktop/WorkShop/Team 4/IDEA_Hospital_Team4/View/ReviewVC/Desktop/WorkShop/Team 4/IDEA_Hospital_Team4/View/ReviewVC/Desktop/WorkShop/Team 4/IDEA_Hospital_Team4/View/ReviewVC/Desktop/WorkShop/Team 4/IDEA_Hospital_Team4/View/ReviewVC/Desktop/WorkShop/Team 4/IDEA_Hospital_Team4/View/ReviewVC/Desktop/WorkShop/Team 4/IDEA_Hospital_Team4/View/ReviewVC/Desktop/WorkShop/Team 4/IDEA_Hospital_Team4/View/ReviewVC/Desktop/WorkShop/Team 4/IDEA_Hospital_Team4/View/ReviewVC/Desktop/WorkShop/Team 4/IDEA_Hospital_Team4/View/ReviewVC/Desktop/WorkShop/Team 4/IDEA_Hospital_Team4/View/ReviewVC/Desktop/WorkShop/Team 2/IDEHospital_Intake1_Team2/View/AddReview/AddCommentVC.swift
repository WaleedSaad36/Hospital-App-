//
//  AddCommentVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 1/4/21.
//

import UIKit

// MARK:- Protocols
protocol AddCommentProtocol: class{
    func hideLoader()
    func showLoader()
    func showAlert(img: UIImage , message: String)

    func check() -> Bool
}

class AddCommentVC: UIViewController {
    
// MARK:- Outlets
    @IBOutlet var addCommentView: AddCommentView!
    
    // MARK: - Properties
    private var viewModel: AddCommentViewModelProtocol!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addCommentView.setup()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.addcommentTextField)
        
    }
    @objc func settingBtnTapped() {
        let setting = SettingVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    // MARK:- Button Methods
    @IBAction func submitBtn(_ sender: Any) {
        
        viewModel.saveComment(rate: Int(addCommentView.rateView.rating) , comment: addCommentView.commentTextField.text!)
    }

       // MARK:- Public Methods
    class func create(id: Int) -> AddCommentVC {
            let addCommentVC: AddCommentVC = UIViewController.create(storyboardName: Storyboards.addComment, identifier: ViewControllers.addCommentVC)
        addCommentVC.viewModel = AddCommentViewModel(view: addCommentVC, id: id)
            return addCommentVC
        }
    }

// MARK: - Implement Protocols
extension AddCommentVC: AddCommentProtocol{
    
    func showAlert(img: UIImage , message: String) {
        let alertPayload = AlertPayload(img:img,message: message) {
            let doc = DoctorProfileVC.create(id: UserDefaultsManager.shared().docID!)
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.pushViewController(doc, animated: true)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
    func check() -> Bool {
        guard let comment = addCommentView.commentTextField.text,!comment.isEmpty
            else {return false}
        return true
    }
}
