//
//  ArticlesResponse.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Foundation

// MARK: - ArticleResponse
class ArticlesResponse: Codable {
    var results: [Article]?

    init(results: [Article]?) {
        self.results = results
    }
}
