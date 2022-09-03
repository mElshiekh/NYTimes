//
//  HomeViewModel.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import RxCocoa
import RxSwift

class HomeViewModel {
    private var disposeBag = DisposeBag()
    var articlesViewData = BehaviorRelay<[Article]>(value: [])
    var isLoadingViewData = BehaviorRelay<Bool>(value: false)
    var errorViewData = PublishSubject<String?>()
    
    private var days = 1
    
    func getArticles() {
        isLoadingViewData.accept(true)
        ArticleManager.shared.getArticles(days: "\(days)").asObservable().subscribe { [weak self] resp in
            self?.articlesViewData.accept(resp?.results ?? [])
            self?.isLoadingViewData.accept(false)
        } onError: { [weak self]  error in
            self?.isLoadingViewData.accept(false)
            self?.errorViewData.onNext(error.localizedDescription)
            
        }.disposed(by: disposeBag)

    }
}
