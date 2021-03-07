////
////  SearchResultViewModel.swift
////  IDEHospital_Intake1_Team5
////
////  Created by Mohamed Azooz on 12/19/20.
////  Copyright © 2020 Abeer. All rights reserved.
////
//
//import Foundation
//
//// MARK: - Protocol
//protocol searchResultViewModelProtocol {
//    func getAllDoctors ()
//    func sendDoctors() -> [Item]
//}
//
//class SearchResultViewModel {
//    var searchResultVC: SearchResultVCProtocol!
//    var doctors = [Item]()
//    init(view: SearchResultVCProtocol) {
//        self.searchResultVC = view
//    }
//}
//
//
//extension SearchResultViewModel: searchResultViewModelProtocol{
//    func sendDoctors() -> [Item] {
//        return doctors
//    }
//    
//    func getAllDoctors () {
//        APIManager.getDoctors(id: "1", specialtyId: "5", cityId: "1", regionId: "1", companyId: "1", doctorName: "Mohamed Yehia") { (response) in
//            switch response {
//            case .failure(let error):
//                print(error.localizedDescription)
//            case .success(let result):
//                if result.code == 200 {
//                    self.doctors = result.data.items
//                    self.searchResultVC.searchResultview().doctorsTabelView.reloadData()
//                    print("///////////////////////////")
//                }
//            }
//        }
//    }
//}
