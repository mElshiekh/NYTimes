//
//  ArticleDetailsViewController.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import RxCocoa
import RxSwift
import UIKit

class ArticleDetailsViewController: UIViewController {
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var abstractLabel: UILabel!

    var viewModel: ArticleDetailsViewModel?
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewData()
    }
}

extension ArticleDetailsViewController {
    private func bindViewData() {
        viewModel?.articleViewData.asObservable().subscribe(onNext: { [weak self] article in
            self?.setupData(article: article)
        }).disposed(by: disposeBag)
    }

    private func setupData(article: Article) {
        if let image = article.media?.first?.mediaMetadata?.last?.url {
            articleImageView.setImageWith(urlString: image)
        }
        titleLabel.text  = article.title
        sectionLabel.text  = article.section
        dateLabel.text  = Date.switchStringFormateOf(date: article.publishedDate, toFormate: DateFormates.dayMonthYearDashSeparated.rawValue)
        abstractLabel.text  = article.abstract
    }
}
