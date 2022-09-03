//
//  ArticleTableViewCell.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    static var identifier = "ArticleTableViewCell"

    var stackView: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.distribution = .fill
        s.alignment = .fill
        s.axis = .vertical
        s.spacing = 8
        s.semanticContentAttribute = .forceLeftToRight
        return s
    }()

    var topStackView: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.distribution = .fillEqually
        s.alignment = .fill
        s.axis = .horizontal
        s.spacing = 8
        s.semanticContentAttribute = .forceLeftToRight
        return s
    }()

    var titleLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        return l
    }()

    var dateLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.textAlignment = .right
        return l
    }()

    var subjectLabel: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        l.textAlignment = .left
        return l
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        addSubview(stackView)
        stackView.fillSuperView(shouldUseSafeArea: true, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(topStackView)
        topStackView.addArrangedSubview(subjectLabel)
        topStackView.addArrangedSubview(dateLabel)
    }

    func setup(title: String?, subject: String?, date: String?) {
        titleLabel.text = title
        dateLabel.text = date
        subjectLabel.text = subject
    }
}
