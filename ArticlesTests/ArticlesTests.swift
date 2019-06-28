//
//  ArticlesTests.swift
//  ArticlesTests
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import XCTest
@testable import Articles

class ArticlesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testArticleSearch() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var params = [String : Any]()
        params["q"] = "election"
        params["api-key"] = appConfigs.apiKey
        var articleResponse: [Article]?
        
        let searchArticlesExpectation = expectation(description: "Search Articles")

        _ = ArticlesLoader().searchArticles(params, successBlock: { (articles) in
            articleResponse = articles
            searchArticlesExpectation.fulfill()
        }) { (error) in
            XCTAssertFalse(true, "Error got!")
        }
        
        waitForExpectations(timeout: 15) { (error) in
            XCTAssertNotNil(articleResponse)
        }
    }

    func testMostPopularEmailedArticles() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var params = [String : Any]()
        params["api-key"] = appConfigs.apiKey
        var articleResponse: [MostPopularArticle]?
        
        let searchArticlesExpectation = expectation(description: "Most Popular Emailed Articles")
        
        _ = ArticlesLoader().getArticlesOf(type: ArticleType.emailed, params, successBlock: { (articles) in
            articleResponse = articles
            searchArticlesExpectation.fulfill()
        }) { (error) in
            XCTAssertFalse(true, "Error got!")
        }
        
        waitForExpectations(timeout: 15) { (error) in
            XCTAssertNotNil(articleResponse)
        }
    }

    func testMostPopularSharedArticles() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var params = [String : Any]()
        params["api-key"] = appConfigs.apiKey
        var articleResponse: [MostPopularArticle]?
        
        let searchArticlesExpectation = expectation(description: "Most Popular Shared Articles")
        
        _ = ArticlesLoader().getArticlesOf(type: ArticleType.shared, params, successBlock: { (articles) in
            articleResponse = articles
            searchArticlesExpectation.fulfill()
        }) { (error) in
            XCTAssertFalse(true, "Error got!")
        }
        
        waitForExpectations(timeout: 15) { (error) in
            XCTAssertNotNil(articleResponse)
        }
    }

    func testMostPopularViewedArticles() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var params = [String : Any]()
        params["api-key"] = appConfigs.apiKey
        var articleResponse: [MostPopularArticle]?
        
        let searchArticlesExpectation = expectation(description: "Most Popular Viewed Articles")
        
        _ = ArticlesLoader().getArticlesOf(type: ArticleType.viewed, params, successBlock: { (articles) in
            articleResponse = articles
            searchArticlesExpectation.fulfill()
        }) { (error) in
            XCTAssertFalse(true, "Error got!")
        }
        
        waitForExpectations(timeout: 15) { (error) in
            XCTAssertNotNil(articleResponse)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
