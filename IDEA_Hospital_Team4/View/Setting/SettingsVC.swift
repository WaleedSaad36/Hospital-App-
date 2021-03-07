//
//  SettingsVC.swift
//  IDE Hospital
//
//  Created by Ibrahim El-geddawy on 10/19/20.
//

import UIKit

enum ComeFrom {
    case settings
    case tabbar
}

class SettingsVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var settingsView: SettingsView!
    
    // MARK: - Properties
    static let ID = "\(SettingsVC.self)"

    // MARK:- Private Properties
    private let loggedinItems = [
        ("Edit Profile", Asset.userSetting.image),
        ("Favourite", Asset.heartblue.image),
        ("Booked Appointments", Asset.calendar2.image),
        ("About US", Asset.about.image),
        ("Contact Us", Asset.contact.image),
        ("Share", Asset.share.image),
        ("Terms And Conditions", Asset.sheet.image),
        ("Logout", Asset.login.image)
    ]
    private let loggedoutItems = [
        ("Login", Asset.login.image),
        ("About US", Asset.about.image),
        ("Contact Us", Asset.contact.image),
        ("Share", Asset.share.image),
        ("Terms And Conditions", Asset.sheet.image)
    ]
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView.setup()
        setupDelegates()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setupNavController()
        setupBackButton()
        self.tabBarController?.tabBar.isHidden = false
        
    }

    // MARK:- Public Methods
    class func create() -> SettingsVC {
        let settingsVC: SettingsVC = UIViewController.create(storyboardName: Storyboards.settings, identifier: "\(SettingsVC.self)")
        return settingsVC
    }
}

// MARK:- TableView DataSource
extension SettingsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserDefaultsManager.shared().isLoggedIn{
            return loggedinItems.count
        }
        return loggedoutItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupCell(in: tableView, at: indexPath)
    }
}

// MARK:- TableView Delegate
extension SettingsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleSelectedRow(at: indexPath)
    }
}

// MARK:- Private Methods
extension SettingsVC {
    private func setupDelegates() {
        settingsView.settingsTableView.delegate = self
        settingsView.settingsTableView.dataSource = self
    }
    private func setupCell(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.ID, for: indexPath) as! SettingsTableViewCell
        if UserDefaultsManager.shared().isLoggedIn{
            cell.item = loggedinItems[indexPath.row]
        }else{
            cell.item = loggedoutItems[indexPath.row]
        }
        return cell
    }
    private func handleSelectedRow(at indexPath: IndexPath) {
        var vc: UIViewController?
        if UserDefaultsManager.shared().isLoggedIn{
            switch indexPath.row {
            case 0:
                vc = EditProfileVC.create()
            case 1:
                vc = FavoriteVC.create(comeFrom: .settings)
            case 2:
                vc = MyAppointmentsVC.create(comeFrom: .settings)
            case 3:
                vc = StaticContentVC.create(type: .aboutus)
            case 4:
                vc = RequestVC.create(type: .contactus)
            case 5:
                shareApp()
            case 6:
                vc = StaticContentVC.create(type: .termsAndConditions)
            case 7:
                self.showLogoutAlert()
            default:
                print("Cell \(indexPath.row) tapped")
            }
        }else{
            switch indexPath.row {
            case 0:
                vc = LoginVC.create()
            case 1:
                vc = StaticContentVC.create(type: .aboutus)
            case 2:
                vc = RequestVC.create(type: .contactus)
            case 3:
                shareApp()
            case 4:
                vc = StaticContentVC.create(type: .termsAndConditions)
            default:
                print("Cell \(indexPath.row) tapped")
            }
        }
        
        if let vc = vc {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    private func showLogoutAlert() {
        UserDefaultsManager.shared().isLoggedIn = false
        UserDefaultsManager.shared().token = nil
        AppRoot.createRoot()
    }
    private func shareApp(){
        let text = "Here Signup "
        //TODO: add ReferralCode , and App link
//        let link = "https://apps.apple.com/app/id{{appId}}"
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop ]

        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    private func setupNavBar() {
        // NavBar Appearance
        setViewControllerTitle(to: "Settings")
        setupNavController()
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexString: "#001867")
        setupBackButton(isWhite: true)
    }
}
