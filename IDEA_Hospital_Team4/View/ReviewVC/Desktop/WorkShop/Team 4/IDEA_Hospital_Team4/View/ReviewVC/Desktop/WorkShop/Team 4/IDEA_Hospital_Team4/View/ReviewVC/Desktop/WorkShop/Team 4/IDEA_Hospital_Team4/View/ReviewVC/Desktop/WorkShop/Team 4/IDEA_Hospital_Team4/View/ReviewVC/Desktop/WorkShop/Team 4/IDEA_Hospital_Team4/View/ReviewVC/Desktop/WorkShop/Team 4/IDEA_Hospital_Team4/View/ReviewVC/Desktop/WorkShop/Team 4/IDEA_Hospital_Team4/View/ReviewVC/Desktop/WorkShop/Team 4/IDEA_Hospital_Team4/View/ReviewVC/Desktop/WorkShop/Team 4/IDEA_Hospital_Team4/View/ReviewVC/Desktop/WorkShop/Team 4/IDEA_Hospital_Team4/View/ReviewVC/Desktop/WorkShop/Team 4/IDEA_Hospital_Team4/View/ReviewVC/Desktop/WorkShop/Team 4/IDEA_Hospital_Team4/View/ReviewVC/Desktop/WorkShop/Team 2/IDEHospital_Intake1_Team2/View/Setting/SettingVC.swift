//
//  SettingVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import UIKit

class SettingVC: UIViewController {
    
    
    @IBOutlet var settingView: SettingView!
    var settingViewModel: SettingViewModal!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation1(view: self, settingAcion: nil, backAcion: #selector(backBtnTapped), title: L10n.setting, backColor: UIColor(named: ColorName.commonButton), tintColor: .white)
        
    }
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    class func create() -> SettingVC {
        let settingVC: SettingVC = UIViewController.create(storyboardName: Storyboards.Setting, identifier: ViewControllers.SettingVC)
        settingVC.settingViewModel = SettingViewModal(view: settingVC)
        return settingVC
    }
    
}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return settingViewModel.returnNames().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingView.settingTableView.dequeueReusableCell(withIdentifier: L10n.cellName, for: indexPath) as! SettingTableViewCell
        cell.settingName.text = settingViewModel.returnNames()[indexPath.row]
        cell.settingImage.image = settingViewModel.returnImages()[indexPath.row]
        cell.settingName.textColor = UIColor(named: ColorName.commonButton)
        cell.arrowSetting.setImage(Asset.blueBack.image, for: .normal)
        cell.arrowSetting.tintColor = UIColor(named: ColorName.commonButton)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UserDefaultsManager.shared().token == nil {
            if indexPath.row == 0 {
               
                let login = SignInVC.create()
                self.navigationController?.pushViewController(login, animated: true)

            }
            else if indexPath.row == 1 {
                let about = AboutUsVC.create(isAbout: true)
                self.navigationController?.pushViewController(about, animated: true)

            }
            else if indexPath.row == 2 {
                let contact = NurseVC.create(checkContact: true)
                self.navigationController?.pushViewController(contact, animated: true)

            }
            else if indexPath.row == 3 {
                let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
                self.present(activityVC, animated: true, completion: nil)
            }
            else if indexPath.row == 4 {
                let about = AboutUsVC.create(isAbout: false)
                self.navigationController?.pushViewController(about, animated: true)

            }
        }
        else {
            if indexPath.row == 0 {
//                let edit = EditProfileVC.create()
//                self.navigationController?.pushViewController(edit, animated: true)
            }
            else if indexPath.row == 1 {
                let favorite = FavouriteVC.create()
                self.navigationController?.pushViewController(favorite, animated: true)

            }
            else if indexPath.row == 2 {
                let appointment = AppointmentVC.create()
                self.navigationController?.pushViewController(appointment, animated: true)

            }
            else if indexPath.row == 3 {
                let about = AboutUsVC.create(isAbout: true)
                self.navigationController?.pushViewController(about, animated: true)

            }
            else if indexPath.row == 4 {
                let contact = NurseVC.create(checkContact: true)
                self.navigationController?.pushViewController(contact, animated: true)
            }
            else if indexPath.row == 5 {
                let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
                self.present(activityVC, animated: true, completion: nil)
            }
            else if indexPath.row == 6 {
                let about = AboutUsVC.create(isAbout: false)
                self.navigationController?.pushViewController(about, animated: true)
            }
            else if indexPath.row == 7 {
                UserDefaultsManager.shared().token = nil
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    
}
extension SettingVC:AboutUsVCProtocol {
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
}
