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
    let testData = TestData.story
    override func setUp() {
        
    }

    override func tearDown() {
        
    }
        
    func testDetailScreenTitle() {
        
        guard let result = testData.results?.first else {
            return
        }
        let testClass = DetailScreenViewModel(result: result)
        XCTAssertEqual(testClass.title, result.trackName)
    }
    
    func testDetailScreenMediaString() {
        
        guard let result = testData.results?.first else {
            return
        }
        let testClass = DetailScreenViewModel(result: result)
        XCTAssertEqual(testClass.mediaString, result.previewUrl)
    }
}
