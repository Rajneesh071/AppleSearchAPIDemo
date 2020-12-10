//
//  AMPlayerTest.swift
//  AppleSearchAPIDemoTests
//
//  Created by Rajneesh on 05/12/20.
//  Copyright © 2020 BRRV. All rights reserved.
//

@testable import AppleSearchAPIDemo
import XCTest

class AMPlayerTest: XCTestCase {
    var soundData : Data!
    
    override func setUp() {
        let url = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        soundData = try! Data(contentsOf: url)
    }

    override func tearDown() {
        soundData = nil
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
}

