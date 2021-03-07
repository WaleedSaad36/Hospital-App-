//
//  InfosViewController.swift
//  IDE Hospital
//
//  Created by Ibrahim El-geddawy on 10/19/20.
//

import UIKit

protocol StaticContentVCProtocol: class {
    func showLoader()
    func hideLoader()
    func showText(text: String)
    func handleError(with message: String)
}

class StaticContentVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var staticContentView: StaticContentView!
    
    // MARK: - Properties
    private var viewModel: StaticContentViewModelProtocol!
    static let ID = "\(StaticContentVC.self)"
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        staticContentView.setup()
        self.setupNavController()
        setupBackButton()
        setBackgroungImage()
        setViewControllerTitle(to: viewModel.getTitle())
        viewModel.setup()
    }

    // MARK:- Public Methods
    class func create(type: StaticContentType) -> StaticContentVC {
        let infosvc: StaticContentVC = UIViewController.create(storyboardName: Storyboards.settings, identifier: "\(StaticContentVC.self)")
        infosvc.viewModel = StaticContentViewModel(view: infosvc, type: type)
        return infosvc
    }
}

//MARK:- Conform Protocol
extension StaticContentVC: StaticContentVCProtocol{
    func showLoader() {
        self.staticContentView.showLoading()
    }
    func hideLoader() {
        self.staticContentView.hideLoading()
    }
    func showText(text: String) {
        self.staticContentView.setLabel(text: text)
    }
    func handleError(with message: String) {
        self.showCustomAlert(type: .failButton, message: message, title: "Ok", delgate: nil)
    }
}
