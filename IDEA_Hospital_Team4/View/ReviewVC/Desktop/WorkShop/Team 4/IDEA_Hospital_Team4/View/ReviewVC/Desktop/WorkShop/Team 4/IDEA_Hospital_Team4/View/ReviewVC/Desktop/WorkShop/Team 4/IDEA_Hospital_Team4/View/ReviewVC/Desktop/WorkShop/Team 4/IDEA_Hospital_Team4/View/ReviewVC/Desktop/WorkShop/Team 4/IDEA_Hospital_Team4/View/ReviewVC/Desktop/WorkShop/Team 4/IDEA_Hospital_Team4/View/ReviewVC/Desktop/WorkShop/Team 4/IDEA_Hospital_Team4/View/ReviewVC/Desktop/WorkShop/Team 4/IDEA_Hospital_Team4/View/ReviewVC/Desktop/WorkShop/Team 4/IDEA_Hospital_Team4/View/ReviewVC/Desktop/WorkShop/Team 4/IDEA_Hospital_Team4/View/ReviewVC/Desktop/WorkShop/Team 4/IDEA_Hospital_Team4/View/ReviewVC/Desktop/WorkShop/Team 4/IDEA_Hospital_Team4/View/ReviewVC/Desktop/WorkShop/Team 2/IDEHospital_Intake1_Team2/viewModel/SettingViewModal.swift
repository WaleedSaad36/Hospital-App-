//
//  SettingViewModal.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/1/21.
//

import UIKit
protocol SettingViewModalProtocol {
    func returnNames()->[String]
    func returnImages()->[UIImage]
}
class SettingViewModal {
    
    weak var view: AboutUsVCProtocol!
    var unLoginSettingArray = [L10n.editProfile, L10n.favorites, L10n.bookedAppointment, L10n.aboutUs, L10n.contactUs, L10n.share, L10n.termsCondition, L10n.logout]
    var unLoginImageArray = [Asset.user.image, Asset.blueheart.image, Asset.calendar.image, Asset.about.image, Asset.contact.image, Asset.share.image, Asset.sheet.image, Asset.login.image]
    
    var LoginSettingArray = [L10n.login, L10n.aboutUs, L10n.contactUs, L10n.share, L10n.termsCondition]
    var LoginImageArray = [Asset.login.image, Asset.about.image, Asset.contact.image, Asset.share.image, Asset.sheet.image]
    
    init(view: AboutUsVCProtocol) {
        self.view = view
       
    }
    
}
extension SettingViewModal:SettingViewModalProtocol {
    func returnImages() -> [UIImage] {
        if UserDefaultsManager.shared().token == nil {
            return LoginImageArray
        }
        else {
            return unLoginImageArray
        }
    }
    
    func returnNames() -> [String] {
        if UserDefaultsManager.shared().token == nil {
            return LoginSettingArray
        }
        else {
            return unLoginSettingArray
        }
    }
    
    
}
