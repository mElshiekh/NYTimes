//
//  NYTimes_appTests.swift
//  NYTimes appTests
//
//  Created by Mohamed on 02/09/2022.
//

@testable import NYTimes_app
import XCTest

class NYTimes_appTests: XCTestCase {
    let article = Article(uri: nil, url: "google.com", id: 5000, assetID: nil, publishedDate: "2022-09-01", section: nil, title: "title", media: nil, abstract: nil)

    func testParsingData() throws {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(article) {
            let parsed: Article? = NetworkParserHelper.shared.parseResponse(data: encoded)
            XCTAssertNotNil(parsed)
            XCTAssertEqual(parsed?.id, 5000, "wrong parsing")
        }
    }

    func testRetrievingPersistedData() throws {
        let value = PersistanceHelper.shared.getObject(from: PersistanceTypes.plist, key: "TestValue") as? String
        XCTAssertEqual(value, "test", "invalid data persistance retrieval \(value)")
    }

    func testDateStringFormateConversion() throws {
        let converedDateString = Date.switchStringFormateOf(date: article.publishedDate, toFormate: DateFormates.dayMonthYearDashSeparated.rawValue)
        XCTAssertEqual(converedDateString, "01-09-2022", "invalid date conversion \(converedDateString)")
    }

    func testCreatingViewController() throws {
        let vc = ArticleDetailsViewController.loadFromNib() as? UIViewController
        XCTAssertTrue(vc is ArticleDetailsViewController)
    }
}
