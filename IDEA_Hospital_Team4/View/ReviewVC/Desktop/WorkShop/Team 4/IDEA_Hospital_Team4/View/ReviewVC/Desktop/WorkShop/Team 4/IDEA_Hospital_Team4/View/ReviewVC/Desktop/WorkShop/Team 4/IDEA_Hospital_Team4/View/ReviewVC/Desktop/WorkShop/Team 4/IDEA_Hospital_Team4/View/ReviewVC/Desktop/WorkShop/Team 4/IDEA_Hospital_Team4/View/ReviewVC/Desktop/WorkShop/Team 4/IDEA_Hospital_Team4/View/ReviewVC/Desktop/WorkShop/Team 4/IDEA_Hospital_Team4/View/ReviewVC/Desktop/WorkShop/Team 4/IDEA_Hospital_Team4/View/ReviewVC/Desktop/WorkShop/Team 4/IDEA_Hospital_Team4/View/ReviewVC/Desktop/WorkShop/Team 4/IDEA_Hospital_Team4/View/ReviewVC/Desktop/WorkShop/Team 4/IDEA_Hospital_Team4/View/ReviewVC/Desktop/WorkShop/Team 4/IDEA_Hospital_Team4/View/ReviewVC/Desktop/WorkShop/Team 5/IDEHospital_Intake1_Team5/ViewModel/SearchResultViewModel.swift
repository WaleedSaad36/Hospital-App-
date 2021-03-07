//
//  SearchResultViewModel.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/19/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation

// MARK: - Protocol
protocol searchResultViewModelProtocol {
    func getAllDoctors ()
    func sendDoctors() -> [DoctoreItem]
}

class SearchResultViewModel {
    private weak var searchResultVC: SearchResultVCProtocol!
    var doctors = [DoctoreItem]()
    init(view: SearchResultVCProtocol) {
        self.searchResultVC = view
    }
}


extension SearchResultViewModel: searchResultViewModelProtocol{
    func sendDoctors() -> [DoctoreItem] {
        return self.doctors
    }
    
    func getAllDoctors () {
        self.searchResultVC?.processOnStart()
        APIManager.getDoctors(id: "1", specialtyId: "5", cityId: "1", regionId: "1", companyId: "1", doctorName: "Mohamed Yehia") { (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
                self.searchResultVC.showErrorMsg(message: "\(error.localizedDescription)")
            case .success(let result):
                if result.code == 200 {
                    self.doctors = result.data.items
                    if  self.doctors.count == 0 {
                          print("no data fetch")
                          self.searchResultVC.noItemsConfiguration()
                    }else {

                    self.searchResultVC.searchResultview().doctorsTabelView.reloadData()
                    print("///////////////////////////")
                    }
                    self.searchResultVC?.processOnStop()
                }
            }
        }
    }
}
