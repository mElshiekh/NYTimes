//
//  UIImageView+Extensions.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Kingfisher

extension UIImageView {
    func setImageWith(urlString: String, placeholder: UIImage? = nil, indicator: IndicatorType = .activity, completion: ((_: UIImage?) -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            if let url = URL(string: urlString) {
                self?.kf.indicatorType = indicator
                self?.kf.setImage(
                    with: url,
                    placeholder: placeholder,
                    options: [
                    ], completionHandler: {
                        result in
                        switch result {
                        case .success:
                            completion?(self?.image)
                        case .failure:
                            if placeholder == nil {
                                self?.setDefaultImage()
                            } else {
                                self?.image = placeholder
                            }
                            break
                        }
                    })
            } else {
                if placeholder == nil {
                    self?.setDefaultImage()
                } else {
                    self?.image = placeholder
                }
            }
        }
    }

    func setDefaultImage() {
        image = UIImage(color: .gray, size: bounds.size)
    }
}
