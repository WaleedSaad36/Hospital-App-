//
//  UIViewController + NavControllerSetup.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/16/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import UIKit

extension UIViewController{
    func setupNavController() {
        // NavBar Appearance
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        // Remove shadow
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.init(white: 204.0/255.0, alpha: 1.0)
    }
    func setViewControllerTitle(to title:String, fontColor: UIColor = .white) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 75, height: 25))
        titleLabel.font = FontFamily.PTSans.bold.font(size: 20)
        titleLabel.textAlignment = .center
        titleLabel.text = title
        titleLabel.textColor = fontColor
        self.navigationItem.titleView = titleLabel
    }
    func addSettingsButton(isWhite: Bool = false) {
        let settings = Asset.settings.image
        let settingsButtonItem = UIBarButtonItem.init(image: settings, style: .done, target: self, action: #selector(settingsButtonTapped))
        if isWhite{
            settingsButtonItem.tintColor = .white
        }else{
            navigationController?.navigationBar.tintColor = UIColor(hexString: "#848585")
        }
        self.navigationItem.rightBarButtonItem = settingsButtonItem
    }
    func setupBackButton(isWhite: Bool = false) {
        let backImage = Asset.back.image
        if isWhite{
            navigationController?.navigationBar.tintColor = .white
        }else{
            navigationController?.navigationBar.tintColor = UIColor(hexString: "#848585")
        }
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action:  #selector(backButtonPressed))
        self.navigationItem.leftBarButtonItem = backButton
    }
    func setupBackTooRoot() {
        let backImage = Asset.back.image
        navigationController?.navigationBar.tintColor = UIColor(hexString: "#848585")
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action:  #selector(backButtonPressAction))
        self.navigationItem.leftBarButtonItem = backButton
    }
}

// MARK:- Actions
extension UIViewController {
    @objc private func settingsButtonTapped() {
        let settingsVC = SettingsVC.create()
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func backButtonPressAction() {
        AppRoot.createRoot()
    }
}
