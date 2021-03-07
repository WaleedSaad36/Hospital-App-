//
//  MainViewModel.swift
//  IDE Hospital
//
//  Created by Elshaer on 10/15/20.
//

import UIKit

protocol MainViewModelProtocol {
    func getMainCategories() -> [MainCategory]
    func getMainData()
    func getMainCategoreData(for item: Int) -> MainCategory
    func getMainCategoriesCount() -> Int
}

class MainViewModel {
    
    // MARK:- Private Properties
    private weak var view: MainVCProtocol?
    private var mainCategories = [MainCategory]()

    // MARK:- Init
    init(view: MainVCProtocol) {
        self.view = view
    }
}

//MARK:- Conform Protocol
extension MainViewModel: MainViewModelProtocol {
    
    func getMainCategoreData(for item: Int) -> MainCategory {
        return mainCategories[item]
    }
    func getMainCategoriesCount() -> Int {
        return mainCategories.count
    }
    func getMainCategories() -> [MainCategory] {
        return mainCategories
    }
    func getMainData(){
        self.view?.showLoader()
        APIManager.getMainCategories { (response) in
            switch response {
            case .success(let result):
                if result.code == 200 {
                    self.mainCategories = result.data
                    self.view?.reloadCollectionView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.view?.hideLoader()
        }
    }
}
