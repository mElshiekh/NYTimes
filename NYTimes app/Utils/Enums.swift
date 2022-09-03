//
//  Enums.swift
//  NYTimes app
//
//  Created by Mohamed on 02/09/2022.
//

import Foundation

enum PersistanceTypes {
    case plist
}

enum DateFormates: String {
    case DateSlashTime12HourFormate = "dd.MM.yyyy / hh:mm a"
    case DateSlashTime = "dd.MM.yyyy / hh:mm"
    case DateTimeFormate = "yyyy-MM-dd'T'HH:mm:ss"
    case DateSpaceTimeDashSeparatedFormate = "yyyy-MM-dd HH:mm:ss"
    case DateTimeFormateWithSecond = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    case MonthYear = "MMM yyyy"
    case DayMonthYear = "dd MMM yyyy"
    case Time12 = "hh:mm a"
    case Time24 = "HH:mm"
    case Month = "MM"
    case MonthString = "MMM"
    case DateDashSeparated = "yyyy-MM-dd"
    case dayMonthYearDashSeparated = "dd-MM-yyyy"
    case MonthSlashYear = "MM/yyyy"
    case DaySlashMonthSlashYear = "dd/MM/yyyy"
    case DateSpaceTime = "dd.MM.yyyy hh:mm"
    case dateWithMicroSeconds = "yyyy-MM-dd'T'HH:mm:ss.SSSS"
    case UTCFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
    case DayMonth = "dd MMMM"
    case MonthDayComaYearTime = "MMM d, yyyy h:mm a"
    case DayShortMonth = "d MMM"
    case Day = "d"
}
