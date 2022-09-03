//
//  UIViewController+Extension.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
