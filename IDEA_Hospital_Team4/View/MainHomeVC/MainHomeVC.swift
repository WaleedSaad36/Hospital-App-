//
//  MainVC.swift
//  IDE Hospital
//
//  Created by Elshaer on 10/15/20.
//

import UIKit

protocol MainVCProtocol: class {
    func showLoader()
    func hideLoader()
    func reloadCollectionView()
}

class MainVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var mainView: MainView!
    
    // MARK: - Properties
    var viewModel: MainViewModelProtocol!
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.setup()
        self.viewModel = MainViewModel(view: self)
        setupCollectionViewDelegates()
        viewModel.getMainData()
        self.setBackgroungImage()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavController()
        setViewControllerTitle(to: "Choose Services")
    }
    // MARK:- Public Methods
    class func create() -> MainVC {
        let mainVC: MainVC = UIViewController.create(storyboardName: Storyboards.main, identifier: "\(MainVC.self)")
        mainVC.viewModel = MainViewModel(view: mainVC)
        return mainVC
    }
}

// MARK:- Private Methods
extension MainVC {
    private func setupCollectionViewDelegates(){
        mainView?.mainCategoriesColledtionView.delegate = self
        mainView?.mainCategoriesColledtionView.dataSource = self
    }
}

// MARK:- UICollectionViewDelegate, UICollectionViewDataSource
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getMainCategoriesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.mainView.mainCategoriesColledtionView.dequeueReusableCell(withReuseIdentifier: CustomCells.mainCell, for: indexPath) as? MainCell else {return UICollectionViewCell()}
        
         let mainCategore = viewModel.getMainCategoreData(for: indexPath.item)
         cell.configCell(categore: mainCategore)
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainCategoriesID = viewModel.getMainCategoreData(for: indexPath.item).id
        if mainCategoriesID == 4 {
            // goTOHomeNurse
            goToHomeNurse()
            
        } else {
            let tabBarVC = TabBarVC()
            tabBarVC.mainID = mainCategoriesID
            tabBarVC.modalPresentationStyle = .overFullScreen
            self.present(tabBarVC, animated: true, completion: nil)
        }
    }

}

//MARK:- Conform Protocol
extension MainVC: MainVCProtocol {
    func showLoader() {
        mainView?.showLoading()
    }
    
    func hideLoader() {
        mainView?.hideLoading()
    }
    
    func reloadCollectionView() {
        mainView?.mainCategoriesColledtionView.reloadData()
    }
}
extension MainVC {
    func goToHomeNurse(){
    let homeNurseVC = HomeNurseVC.create()
        self.navigationController?.pushViewController(homeNurseVC, animated: true)
    }
}
