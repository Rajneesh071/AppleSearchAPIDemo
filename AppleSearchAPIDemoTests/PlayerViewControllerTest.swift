//
//  PlayerViewControllerTest.swift
//  AppleSearchAPIDemoTests
//
//  Created by Rajneesh on 05/12/20.
//  Copyright © 2020 BRRV. All rights reserved.
//

import XCTest
@testable import AppleSearchAPIDemo

class PlayerViewControllerTest: XCTestCase {
    var detailScreenViewModel : DetailScreenViewModel!
    
    override func setUp() {
        let testData = TestData.story
        let result = testData.results?.first
        detailScreenViewModel = DetailScreenViewModel(result: result!)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlayerViewController_PlayButton() {
        let controller = PlayerViewController(viewModel: detailScreenViewModel)
        _ = controller.view
        XCTAssertFalse(controller.playButton.isEnabled)
    }

    func testPlayerViewController_Title() {
        
        let controller = PlayerViewController(viewModel: detailScreenViewModel)
        _ = controller.view
        controller.beginAppearanceTransition(true, animated: true)
        XCTAssertEqual(controller.title, detailScreenViewModel?.title)
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
