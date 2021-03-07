//
//  FavoriteViewModel.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/21/20.
//  Copyright © 2020 Abeer. All rights reserved.
//
//MARK:- Protocol of FavoriteViewModelProtocol
protocol FavoriteViewModelProtocol {
    func serviceOfGetAllFavorites()
    func getGetAllFavoritesItems()-> [FavoriteItems]
    func callDeleteService(_ item: FavoriteItems!)
    func tryDeleteItemConfirm(indexPath: Int)
}
import Foundation
//MARK:- FavoriteViewModel
class FavoriteViewModel {
    //MARK:- Properties
    private weak var myFavoritesVC: MyFavoritesVCProtocol!
    init(myFavoritesVC: MyFavoritesVCProtocol) {
        self.myFavoritesVC = myFavoritesVC
    }
     var favoritesItemsArray = [FavoriteItems]()
}
//MARK:- extension
extension FavoriteViewModel: FavoriteViewModelProtocol  {
    func tryDeleteItemConfirm(indexPath: Int) {
        self.myFavoritesVC.deleteRows(indexPath)
    }
    
    func getGetAllFavoritesItems() -> [FavoriteItems] {
        return self.favoritesItemsArray
    }
    //MARK:-  Handle Response
    func serviceOfGetAllFavorites(){
        self.myFavoritesVC?.processOnStart()
        APIManager.favoritesDoctors { (response) in
            switch response{
            case .failure(let error):
                print("there is error \(error.localizedDescription)")
                self.myFavoritesVC.showErrorMsg(message: "\(error.localizedDescription)")
            case .success(let result):
                print("\(HeaderValues.brearerToken)")
                self.favoritesItemsArray = result.data.items
                print("in response : \(self.favoritesItemsArray)")
                if  self.favoritesItemsArray.count == 0 {
                      print("no data fetch")
                      self.myFavoritesVC.noItemsConfiguration()
                }else {
                    print("count in data: \(self.favoritesItemsArray.count)")
                    self.myFavoritesVC?.reloadData()
                }
                self.myFavoritesVC?.processOnStop()
            }
        }
    }
  //  Delete item
    func callDeleteService(_ item: FavoriteItems!){
        let id = String(item.id)
      //  print("id in userDefult : \(UserDefaultsManager.shared().taskID ?? "")")
        self.myFavoritesVC?.processOnStart()
            APIManager.addDeleteDoctor(id){ (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
                self.myFavoritesVC?.showErrorMsg(message: (error.localizedDescription))
            case .success(let result):
                let result = result
                if result.success == true {
                    self.myFavoritesVC?.processOnStop()
                    self.myFavoritesVC.reloadData()
                    self.myFavoritesVC?.showSuccessMsg(message:Messages.deleteItemSuccessMsg)
                }
            }
            self.myFavoritesVC?.processOnStop()
        }
    }

    
}
