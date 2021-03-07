//
//  AppDelegate.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/7/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyAj-Uiio6A9QxlJWD7xfI7zSdW82kCPoGU")
        GMSPlacesClient.provideAPIKey("AIzaSyAj-Uiio6A9QxlJWD7xfI7zSdW82kCPoGU")

        return true
    }
    

}

