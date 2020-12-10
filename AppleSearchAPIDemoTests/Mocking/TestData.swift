//
//  TestData.swift
//  AppleSearchAPIDemoTests
//
//  Created by Rajneesh on 02/12/20.
//  Copyright © 2020 Nagarro. All rights reserved.
//

import Foundation
@testable import AppleSearchAPIDemo

struct TestData {
    static let story : Json4Swift_Base = {
        let url = Bundle.main.url(forResource: "Story", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try! decoder.decode(Json4Swift_Base.self, from: data)
    }()
    
    static let data : Data = {
        let url = Bundle.main.url(forResource: "Story", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }()
}
