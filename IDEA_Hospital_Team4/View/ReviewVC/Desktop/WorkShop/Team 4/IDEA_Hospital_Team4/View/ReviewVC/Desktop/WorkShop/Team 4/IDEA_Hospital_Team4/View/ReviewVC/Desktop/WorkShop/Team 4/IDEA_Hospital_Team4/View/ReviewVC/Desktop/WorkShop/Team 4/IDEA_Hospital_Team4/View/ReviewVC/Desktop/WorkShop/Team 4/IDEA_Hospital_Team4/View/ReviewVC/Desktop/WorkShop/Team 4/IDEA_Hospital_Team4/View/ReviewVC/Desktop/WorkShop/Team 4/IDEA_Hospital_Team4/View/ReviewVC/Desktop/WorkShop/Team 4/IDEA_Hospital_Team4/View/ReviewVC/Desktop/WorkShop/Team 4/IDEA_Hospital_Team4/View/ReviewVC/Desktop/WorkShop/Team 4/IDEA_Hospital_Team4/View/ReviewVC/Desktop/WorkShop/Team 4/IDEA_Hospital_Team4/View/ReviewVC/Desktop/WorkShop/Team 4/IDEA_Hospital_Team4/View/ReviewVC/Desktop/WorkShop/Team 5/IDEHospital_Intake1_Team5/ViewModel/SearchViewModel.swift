//
//  SearchViewModel.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/17/20.
//  Copyright © 2020 Abeer. All rights reserved.


import Foundation

// MARK: - Protocol
protocol SearchViewModelProtocol {
    func getAllCategories()
    func sendSpecialties() ->[Specialties]
    func sendCities() ->[Cities]
    func sendRegions() ->[Regions]
    func sendCompanies() ->[Companies]
    func getIdForServiceChoosing(_ id: String)
}
class SearchViewModel {
    var homeViewModel: HomeViewModel?
    var searchVC: SearchVCProtocol!
    private  var specialties = [Specialties]()
    private  var cities = [Cities]()
    private  var regions = [Regions]()
    private  var companies = [Companies]()
    var id: String = ""
    weak var delegate : GetIdDelegate?
    init(view: SearchVCProtocol) {
        self.searchVC = view
    }
}

extension SearchViewModel: SearchViewModelProtocol {
    
    func getIdForServiceChoosing(_ id: String) {
        self.id = id
        print("6.. id in SearchViewModel: \(self.id)")
    }
    
    
    func sendSpecialties() ->[Specialties] {
        return specialties
    }
    func sendCities() ->[Cities] {
        return cities
    }
    func sendRegions() ->[Regions] {
        return regions
    }
    func sendCompanies() ->[Companies] {
        return companies
    }
    
    
    func getAllCategories() {
        let id = UserDefaultsManager.shared().serviceID ?? ""
        print("id in search view : \(id) ")
        APIManager.getCategories(id) {
            (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                if result.code == 200 {
                    self.specialties = result.data.specialties
                    self.cities = result.data.cities
                    for region in self.cities {
                        self.regions.append(contentsOf: region.regions)
                    }
                    print(self.regions)
                    self.companies = result.data.companies
                    self.searchVC.searchview().picker.reloadAllComponents()
                }
            }
        }
    }
}
//extension SearchViewModel: GetIdDelegate {
//    func getId(_ id: String){
//        self.id = id
//        print("5... id in nurse is \(id)")
//    }
//}
