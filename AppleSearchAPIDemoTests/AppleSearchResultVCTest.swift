//
//  AppleSearchResultVCTest.swift
//  AppleSearchAPIDemoTests
//
//  Created by Rajneesh on 06/12/20.
//  Copyright © 2020 BRRV. All rights reserved.
//

import XCTest
@testable import AppleSearchAPIDemo

class AppleSearchResultVCTest: XCTestCase {
    var appleSearchResultVCTestClass : AppleSearchResultVC! = nil
    var viewModel : AppleSearchResultViewModel!
    
    override func setUp() {
        let session  = MockURLSession()
        viewModel = AppleSearchResultViewModel(session: session)
        session.nextData = TestData.data
        let expec = expectation(description: "fetch record")
        viewModel.fetchRecords(search: "https://itunes.apple.com/") { (success) in
            print("success-Raj")
            expec.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        appleSearchResultVCTestClass = AppleSearchResultVC(viewModel: viewModel)
        _ = appleSearchResultVCTestClass.view
    }

    override func tearDown() {
        appleSearchResultVCTestClass = nil
        viewModel = nil
    }

    func testTotalNumberOfRows() {
        let tableView = appleSearchResultVCTestClass.exposePrivateTableView()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0),1)
    }
    
    func testCellItem() {
        let tableView = appleSearchResultVCTestClass.exposePrivateTableView()
        let cell = appleSearchResultVCTestClass.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, viewModel.displayText(at: 0))
    }

    func testSearchController() {
        let tableView = appleSearchResultVCTestClass.exposePrivateTableView()
        let searchController = appleSearchResultVCTestClass.exposePrivateSearchController()
        XCTAssertEqual(tableView.tableHeaderView, searchController.searchBar)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
