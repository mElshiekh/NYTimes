//
//  ArticleAPIs.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Moya

enum ArticleAPIs {
    case PolpularArticles(days: String)
}

extension ArticleAPIs: TargetType, AccessTokenAuthorizable {
    var baseURL: URL { return URL(string: NetworkHelper.shared.baseURL)! }

    var path: String {
        switch self {
        case let .PolpularArticles(days):
            return String(format: "svc/mostpopular/v2/viewed/%@.json", days)
        }
    }

    var method: Method {
        switch self {
        case .PolpularArticles:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .PolpularArticles:
            return .requestParameters(parameters: [NetworkHelper.ParametersNames.apiKey: NetworkHelper.shared.apiKey], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        [:]
    }

    var authorizationType: AuthorizationType? {
        switch self {
        case .PolpularArticles:
            return .none
        }
    }
}
