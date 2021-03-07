//
//  UserDefaultsManager.swift
//  IDEA_Hospital_Team4
//
//  Created by Hossam on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    // MARK:- Singleton
    private static let sharedInstance = UserDefaultsManager()
    
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    // MARK:- Properties
    var isLoggedIn: Bool {
        set{
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isLoggedIn)
        }
        get{
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn)
        }
    }
    
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
}
