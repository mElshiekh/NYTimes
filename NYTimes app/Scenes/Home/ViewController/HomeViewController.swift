//
//  HomeViewController.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    @IBOutlet var articlesTableView: UITableView!

    var viewModel: HomeViewModel? = HomeViewModel()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewData()
        viewModel?.getArticles()
    }
}

extension HomeViewController {
    private func configureUI() {
        setupTableView()
    }

    private func setupTableView() {
        articlesTableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
    }

    private func bindViewData() {
        viewModel?.articlesViewData.asObservable()
            .bind(to: articlesTableView.rx.items(cellIdentifier: ArticleTableViewCell.identifier, cellType: ArticleTableViewCell.self)) { _, element, cell in
                cell.setup(title: element.title, subject: element.section, date: element.publishedDate)
            }.disposed(by: disposeBag)

        articlesTableView.rx.modelSelected(Article.self).subscribe(onNext: { [weak self] article in
            let vc = ArticleDetailsViewController.loadFromNib()
            vc.viewModel = ArticleDetailsViewModel(article: article)
            self?.navigationController?.pushViewController(vc, animated: true)
        })
        .disposed(by: disposeBag)
    }
}
