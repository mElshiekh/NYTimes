//
//  AppDelegate.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        setRoot(type: HomeViewController.self)
        return true
    }
    
}
