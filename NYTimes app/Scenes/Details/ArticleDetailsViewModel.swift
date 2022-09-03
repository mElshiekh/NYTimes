//
//  ArticleDetailsViewModel.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import RxSwift
import RxCocoa

class ArticleDetailsViewModel {
    var articleViewData: BehaviorRelay<Article>
    
    init(article: Article) {
        articleViewData = BehaviorRelay<Article>(value: article)
    }
}
