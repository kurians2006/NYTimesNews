//
//  NewsTest.swift
//  NYTimesNewsTests
//
//  Created by Naeem Paracha on 13/10/2021.
//


import XCTest
@testable import NYTimesNews

class NewsTest: XCTestCase, NewsListingViewModelDelegate {

    enum TestingError: Error {

        case downLoadFailed
    }

    var newsFetchExp: XCTestExpectation?

    let model = NewsListingViewModel()

    override func setUpWithError() throws {

        model.delegate = self
        newsFetchExp = expectation(description: "fetchNews")
        model.fetchNews()
        waitForExpectations(timeout: 60.0, handler: nil)
        if model.news?.isEmpty ?? true {
            throw TestingError.downLoadFailed
        }
    }

    func testPerformanceExample() throws {

        self.measure {
            newsFetchExp = expectation(description: "fetchNews")
            model.fetchNews()
            waitForExpectations(timeout: 60.0, handler: nil)
        }
    }

    func testNewsFetch() {

        let model = NewsListingViewModel()
        model.delegate = self
        newsFetchExp = expectation(description: "fetchNews")
        model.fetchNews()
        waitForExpectations(timeout: 60.0, handler: nil)
        guard let news = model.news else {
            XCTFail("news download failed")
            return
        }

        XCTAssertFalse(news.isEmpty, "No items inside news")
    }


    func didFetchNews(isSuccessFull: Bool) {

        newsFetchExp?.fulfill()
    }

    func didUpdateResults() {

    }

}

