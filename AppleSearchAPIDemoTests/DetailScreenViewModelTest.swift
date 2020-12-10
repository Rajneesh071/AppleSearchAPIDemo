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
    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    func testDummyFunc() {
        let testData = TestData.story
        guard let result = testData.results?.first else {
            return
        }
        
        let testClass = DetailScreenViewModel(result: result)
        XCTAssertEqual(testClass.dummyFunc(), "Raj")
    }
    func testDummyClass() {
        
        let testClass = DummyClass(value: DummyModel(dummyValue: 6))
        XCTAssertEqual(testClass.dummyFunc(), 6)
    }
}
