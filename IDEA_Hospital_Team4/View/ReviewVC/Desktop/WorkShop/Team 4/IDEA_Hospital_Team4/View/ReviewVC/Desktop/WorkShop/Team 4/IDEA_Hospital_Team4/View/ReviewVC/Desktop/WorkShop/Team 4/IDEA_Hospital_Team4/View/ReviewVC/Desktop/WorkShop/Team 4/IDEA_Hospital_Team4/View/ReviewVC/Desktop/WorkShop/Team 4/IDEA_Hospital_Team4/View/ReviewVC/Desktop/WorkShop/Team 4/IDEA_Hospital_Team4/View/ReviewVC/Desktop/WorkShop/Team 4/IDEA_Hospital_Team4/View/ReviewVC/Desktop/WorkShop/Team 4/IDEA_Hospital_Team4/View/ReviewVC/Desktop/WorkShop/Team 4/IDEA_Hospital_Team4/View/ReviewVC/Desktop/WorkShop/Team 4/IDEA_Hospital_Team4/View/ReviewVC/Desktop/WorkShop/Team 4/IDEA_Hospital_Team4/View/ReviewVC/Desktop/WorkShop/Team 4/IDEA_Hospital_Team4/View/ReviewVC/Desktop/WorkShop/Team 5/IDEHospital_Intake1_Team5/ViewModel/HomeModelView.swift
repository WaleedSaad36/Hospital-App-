//
//  HomeModelView.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/14/20.
//  Copyright © 2020 Abeer. All rights reserved.
//
//MARK:- Protocol of HomeViewModelProtocol
protocol HomeViewModelProtocol {
    func serviceOfGetAllMainCategories()
    func getID(tag: Int)
    func goToNext(tag: Int, id: String)
    func getMainCategoriesData()-> [CategoriesData]
    func getIdArray() -> [String]
}
import Foundation
//MARK:- HomeViewModel
class HomeViewModel {
    //MARK:- Properties
    weak var delegate : GetIdDelegate?
    weak var viewId : SearchViewModel?
    private weak var homeVC: HomeVCProtocol!
    var id: Int?
    private var idArray = [String]()
    init(homeVC: HomeVCProtocol){
        self.homeVC = homeVC
    }
    private var mainCategoriesArray = [CategoriesData]()
}
//MARK:- extension
extension HomeViewModel: HomeViewModelProtocol  {
    func goToNext(tag: Int, id: String) {
        if tag == 2 {
            print("in 2 go to nurse: \(id)")
//            self.delegate?.getId(id)
            self.homeVC.presentNurseScreen(id)
        }else {
            print("in 2 go to main: \(id)")
//            self.delegate?.getId(id)
            self.homeVC.presentSearchScreen(id)
        }
    }
    
    func getIdArray() -> [String] {
        return self.idArray
    }
    
    func getID(tag: Int) {
    }
    
    //MARK:-  Handle Response
    //get all MainCategories
    func serviceOfGetAllMainCategories(){
        self.homeVC?.processOnStart()
        APIManager.main_Categories(completion:{
            (response) in
            switch response{
            case .failure(let error):
                print("there is error \(error.localizedDescription)")
                self.homeVC.setupServicesConfiguration()
                self.homeVC.showErrorMsg(message: "\(error.localizedDescription)")
            case .success(let result):
                self.mainCategoriesArray = result.data
                print(self.mainCategoriesArray)
                if  result.data.count == 0 {
                    print("no data fetch")
                }else {
                    print("count in data: \(self.mainCategoriesArray.count)")
                    self.homeVC.setupServicesToViews()
                    for category in self.mainCategoriesArray {
                        self.idArray.append(String(category.id))
                    }
                }
                self.homeVC?.processOnStop()
            }
        }
        )}
    //MARK:- Public Methods
    func getMainCategoriesData()-> [CategoriesData] {
        return self.mainCategoriesArray
    }
    
}
