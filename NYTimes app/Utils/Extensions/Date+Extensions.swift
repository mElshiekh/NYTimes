//
//  Date+Extensions.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Foundation

extension Date {
    static let dateFormatterWithoutFormat = DateFormatter()

    static func switchStringFormateOf(date: String?, fromFormate: String = DateFormates.DateDashSeparated.rawValue, toFormate: String) -> String {
        guard let date = date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormate
        guard let convertedDate = dateFormatter.date(from: date) else { return "" }
        dateFormatter.dateFormat = toFormate

        let timeStamp = dateFormatter.string(from: convertedDate)
        return timeStamp
    }
}
