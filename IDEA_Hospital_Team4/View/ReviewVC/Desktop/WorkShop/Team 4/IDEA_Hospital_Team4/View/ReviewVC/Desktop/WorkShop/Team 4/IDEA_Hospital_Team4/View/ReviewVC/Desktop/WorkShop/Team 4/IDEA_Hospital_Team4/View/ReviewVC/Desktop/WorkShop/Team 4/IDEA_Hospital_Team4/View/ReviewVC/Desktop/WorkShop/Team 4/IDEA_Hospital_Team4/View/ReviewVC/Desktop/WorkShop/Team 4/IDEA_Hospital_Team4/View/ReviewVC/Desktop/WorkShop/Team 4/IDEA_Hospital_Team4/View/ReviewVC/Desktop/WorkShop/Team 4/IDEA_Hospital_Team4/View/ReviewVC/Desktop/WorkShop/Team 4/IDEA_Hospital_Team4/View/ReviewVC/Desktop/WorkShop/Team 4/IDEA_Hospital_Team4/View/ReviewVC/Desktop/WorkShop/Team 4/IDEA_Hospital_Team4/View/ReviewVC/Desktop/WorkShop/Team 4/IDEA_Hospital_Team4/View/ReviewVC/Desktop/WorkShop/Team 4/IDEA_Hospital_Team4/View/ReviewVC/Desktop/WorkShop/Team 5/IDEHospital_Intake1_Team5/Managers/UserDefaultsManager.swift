//
//  UserDefaultsManager.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/7/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation

class UserDefaultsManager {
// MARK:- Singleton
private static let sharedInstance = UserDefaultsManager()
class func shared() -> UserDefaultsManager {
    return UserDefaultsManager.sharedInstance
}

// MARK:- Properties
    var token: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.token)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.token) != nil else {
                return nil
            }
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.token)!
        }
    }
    var infoLocData: Data? {
        set {
            UserDefaults.standard.set(PropertyListEncoder(), forKey: UserDefaultsKeys.infoLocData)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.infoLocData) != nil else {
                return nil
            }
            return UserDefaults.standard.data(forKey: UserDefaultsKeys.infoLocData)
        }
    }

    var serviceID: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.serviceID)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.serviceID) != nil else {
                return nil
            }
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.serviceID)
        }
    }

}
