//
//  NetworkHelper.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    private init() {}
    
    var apiKey: String {
        let key = PersistanceHelper.shared.getObject(from: .plist, key: PersistanceKeys.apiKey) as? String ?? ""
        return key
    }

    var baseURL: String {
        let url = PersistanceHelper.shared.getObject(from: .plist, key: PersistanceKeys.apiBaseURL) as? String ?? ""
        return url
    }

    struct PersistanceKeys {
        static let apiKey = "APIKey"
        static let apiBaseURL = "BaseURL"
    }

    class ParametersNames {
        static var apiKey = "api-key"
    }
}
