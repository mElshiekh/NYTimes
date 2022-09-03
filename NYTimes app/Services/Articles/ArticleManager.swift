//
//  ArticleManager.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Moya
import RxSwift

class ArticleManager {
    static let shared = ArticleManager()

    let provider = MoyaProvider<ArticleAPIs>()

    private init() {}

    func getArticles(days: String) -> Observable<ArticlesResponse?> {
        let objResponse = PublishSubject<ArticlesResponse?>()
        provider.request(.PolpularArticles(days: days)) { result in
            switch result {
            case let .success(response):
                let parsedData: ArticlesResponse? = NetworkParserHelper.shared.parseResponse(data: response.data)
                objResponse.onNext(parsedData)
                objResponse.onCompleted()
                objResponse.dispose()
            case let .failure(error):
                dump(error)
            }
        }
        return objResponse
    }
}
