//
//  NetworkParserHelper.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Foundation

class NetworkParserHelper {
    static let shared = NetworkParserHelper()
    private init() {}

    func parseResponse<T>(data: Data?) -> T? where T: Codable {
        if let _ = data {
            do {
                let response = try JSONDecoder().decode(T.self, from: data!)
                return response
            } catch {
                print("Handle Error here")
            }
        }
        return nil
    }
}
