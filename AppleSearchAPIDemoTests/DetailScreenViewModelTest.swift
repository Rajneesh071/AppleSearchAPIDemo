//
//  DetailScreenViewModelTest.swift
//  AppleSearchAPIDemoTests
//
//  Created by Rajneesh on 04/12/20.
//  Copyright © 2020 Nagarro. All rights reserved.
//

import XCTest
@testable import AppleSearchAPIDemo

class DetailScreenViewModelTest: XCTestCase {
    var testClass : DetailScreenViewModel!
    var dataPassed : Results?
    
    override func setUp() {
        let testData = TestData.story
        print(testData)
        if let result = testData.results?.first {
            dataPassed = result
            testClass = DetailScreenViewModel(result: result)
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTitle() {
        let testString = dataPassed?.trackName ?? "Detail Screen"
        XCTAssertEqual(testClass.title, testString)
    }
    
    func testMediaString() {
        let testString = dataPassed?.previewUrl
        XCTAssertEqual(testClass.mediaString, testString)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testMediaFileDownloader() {
        
        let session = MockURLSession()
        let expectedData = "{}".data(using: .utf8)
        session.nextData = expectedData
        let expec = expectation(description: "Download Media")
        var actualData: Data?
        testClass.mediaData(session: session) { (data) in
            actualData = data
            expec.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(actualData)
        
    }

}
