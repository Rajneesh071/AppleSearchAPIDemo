//
//  AppleSearchResultViewModelTest.swift
//  AppleSearchAPIDemoTests
//
//  Created by Rajneesh on 02/12/20.
//  Copyright © 2020 Nagarro. All rights reserved.
//

import XCTest
@testable import AppleSearchAPIDemo

class AppleSearchResultViewModelTest: XCTestCase {
    
    var testClass : AppleSearchResultViewModel!
    
    override func setUp() {
        let session  = MockURLSession()
        testClass = AppleSearchResultViewModel(session: session)
        session.nextData = TestData.data
        let expec = expectation(description: "fetch record")
        testClass.fetchRecords(search: "https://itunes.apple.com/") { (success) in
            print("success-Raj")
            expec.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    override func tearDown() {
        testClass = nil
    }

    func testTotalItemCount() {
        XCTAssertEqual(self.testClass.totalItem, 1)
    }
    
    func testArtistName() {
        XCTAssertEqual(self.testClass.artistName(at: 0), "L-Boy")
    }
    
    func testDisplayText() {
        XCTAssertEqual(self.testClass.displayText(at: 0), "L-Boy : Hi.")
    }
    
    func testItemAtCorrectIndex() {
        XCTAssertNotNil(self.testClass.item(at: 0))
    }
    
    func testItemAtWrongIndex() {
        XCTAssertNil(self.testClass.item(at: 5))
    }
    
    func testDisplayThumbnailAtWrongIndex() {
        let dummyImage = UIImage(named: "loading")
        
        let mokeImageDownloader = MokeImageDownloader()
        mokeImageDownloader.dummyImage = dummyImage
        
        var finalImage : UIImage?
        self.testClass.displayThumbnail(at: 1, imageDownloader: mokeImageDownloader) { (image) in
            finalImage = image
        }
        XCTAssertNotEqual(finalImage, dummyImage)
    }
    
    func testDisplayThumbnail() {
        let mokeImageDownloader = MokeImageDownloader()
        let dummyImage = UIImage(named: "loading")
        mokeImageDownloader.dummyImage = dummyImage
        var finalImage : UIImage?
        self.testClass.displayThumbnail(at: 0, imageDownloader: mokeImageDownloader) { (image) in
            finalImage = image
        }
        XCTAssertEqual(finalImage, dummyImage)
    }
    
    func testDisplayThumbnail_defaultLoadingImage() {
        let mokeImageDownloader = MokeImageDownloader()
        
        var finalImage : UIImage?
        self.testClass.displayThumbnail(at: 0, imageDownloader: mokeImageDownloader) { (image) in
            finalImage = image
        }
        XCTAssertEqual(finalImage,UIImage(named: "loading"))
    }
}


class MokeImageDownloader: ImageDownloaderProtocol {
    var dummyImage : UIImage? = nil
    func downloadImage(urlStr: String, onCompletion: @escaping (UIImage?) -> Void) {
        onCompletion(dummyImage)
    }
}
