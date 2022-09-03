//
//  AppDelegate+Extension.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Foundation
import UIKit

extension AppDelegate {
    func setRoot<T: UIViewController>(type: T.Type) {
        let vc = HomeViewController.loadFromNib()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }
}
