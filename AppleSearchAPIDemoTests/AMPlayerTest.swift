//
//  AMPlayerTest.swift
//  AppleSearchAPIDemoTests
//
//  Created by Rajneesh on 05/12/20.
//  Copyright © 2020 BRRV. All rights reserved.
//

import XCTest
@testable import AppleSearchAPIDemo

class AMPlayerTest: XCTestCase {
    var soundData : Data!
    
    override func setUp() {
        let url = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        soundData = try! Data(contentsOf: url)
    }

    override func tearDown() {
    }

    func testMediaPlayer_NotPlayed() {
        let player = AMPlayer(mediaData: soundData)
        XCTAssertFalse(player.mediaPlayed)
    }
    func testMediaPlayer_Played() {
        let player = AMPlayer(mediaData: soundData)
        player.play()
        XCTAssertTrue(player.mediaPlayed)
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

