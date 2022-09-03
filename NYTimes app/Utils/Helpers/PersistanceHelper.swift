//
//  PersistanceHelper.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Foundation

class PersistanceHelper {
    static let shared = PersistanceHelper()
    private init() {}
    
    private var pathDict: [String: AnyObject]? {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            return dict
        }
        return nil
    }

    func getObject(from type: PersistanceTypes, key: String) -> AnyObject? {
        switch type {
        case .plist:
            return pathDict?[key]
        }
    }
}
