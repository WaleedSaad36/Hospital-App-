//
//  ReviewVC.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/10/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
protocol ReviewVCProtocol:class {
    func showAlert(message: String)
    func showAlertFailure(messege: String)
    func showAlertSuccessfully(messege: String)
    func showLoader()
    func hideLoader()
    func popController()
}

class ReviewVC: UIViewController {
    //MARK:- Outlets
    @IBOutlet var reviewView: ReviewView!
    //MARK:- Properties
    private var viewModel:ReviewViewModelProtocol?
    private var viewModelProfileDoc:DrProfileviewModelProtocol?
    
    //MARK:- lifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewView.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
        setupTabBar()
    }
    //MARK:- PublicMethods
    class func create(doctorId:Int) -> ReviewVC {
        let reviewVC: ReviewVC = UIViewController.create(storyboardName: Storyboards.review, identifier: viewControllers.reviewVC )
        reviewVC.viewModel = ReviewViewModel(view: reviewVC, doctorId: doctorId)
        return reviewVC
    }
    
    //MARK:- IBActions Btn
    
    @IBAction func submitReviewBtn(_ sender: Any) {
        self.viewModel?.sendReview(rating: Int(reviewView.starsStackView!.rating) , comment: reviewView.addCommentTxt.text ?? "" )
    }
    
    //MARK:- PrivateMethods
    private func setupNav(){
        setupNavController()
        setViewControllerTitle(to: "REVIEW")
        addSettingsButton()
        setupBackTooRoot()
    }
    
    private func setupTabBar(){
        tabBarController?.tabBar.isHidden = false
    }

}
extension ReviewVC :ReviewVCProtocol{
    func popController() {
        let drProfileVC: DrProfileVC = DrProfileVC.create(id: viewModel?.getDoctorID() ?? 0)
        self.navigationController?.popToViewController(drProfileVC, animated: true)
    }

    
    func showAlert(message: String) {
        showCustomAlert(type: .defaultAlert(title: "Sorry"), message: message, title: "Ok", delgate: nil)
    }
    
    func showAlertFailure(messege: String) {
        showCustomAlert(type: .failButton, message: messege, title: "Ok", delgate: nil)
    }
    
    func showAlertSuccessfully(messege: String) {
        showCustomAlert(type: .successButton, message: messege, title: "OK", delgate: nil)
        
    }
    func showLoader() {
        reviewView?.showLoading()
    }
    func hideLoader() {
        reviewView?.hideLoading()
    }
}
