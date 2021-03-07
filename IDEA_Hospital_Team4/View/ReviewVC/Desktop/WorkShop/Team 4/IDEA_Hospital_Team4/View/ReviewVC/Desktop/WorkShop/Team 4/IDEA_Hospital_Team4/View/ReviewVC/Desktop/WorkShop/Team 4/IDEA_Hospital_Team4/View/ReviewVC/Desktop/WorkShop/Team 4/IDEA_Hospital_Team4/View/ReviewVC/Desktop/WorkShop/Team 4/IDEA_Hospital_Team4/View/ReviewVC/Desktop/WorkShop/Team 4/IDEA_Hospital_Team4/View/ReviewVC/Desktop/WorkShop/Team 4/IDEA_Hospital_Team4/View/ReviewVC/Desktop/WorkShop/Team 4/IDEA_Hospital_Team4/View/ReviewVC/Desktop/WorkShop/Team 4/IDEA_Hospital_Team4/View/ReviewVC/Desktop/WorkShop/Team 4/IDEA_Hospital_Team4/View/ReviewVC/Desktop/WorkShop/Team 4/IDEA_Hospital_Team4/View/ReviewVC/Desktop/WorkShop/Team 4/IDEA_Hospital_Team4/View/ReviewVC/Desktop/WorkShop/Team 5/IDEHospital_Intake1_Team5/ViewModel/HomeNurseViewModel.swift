//
//  HomeNurseViewModel.swift
//  IDEHospital_Intake1_Team5
//
//  Created by Mohamed Azooz on 12/19/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation

protocol HomeNurseViewModelProtocol {
    func nurseRequest ()
}

class HomeNurseViewModel {
    var homeNurseVC: HomeNurseVCProtocol!
    var requestData = [RequestBodyData]()
    var dataa = RequestBodyData.init(name: "ahmed", mobile: "0234", email: "email@email.com", message: "message")
    init(view: HomeNurseVCProtocol) {
        self.homeNurseVC = view
    }
}

extension HomeNurseViewModel: HomeNurseViewModelProtocol{
    func nurseRequest () {
        APIManager.nurseRequest(body: RequestBodyData(name: "ahmed", mobile: "0234", email: "email@email.com", message: "message")) { (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let result):
                if result.code == 202 {
                    print("///////////////////////////")
                }
            }
        }
    }
}
