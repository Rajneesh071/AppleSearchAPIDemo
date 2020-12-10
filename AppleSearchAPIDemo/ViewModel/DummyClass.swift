//
//  DummyClass.swift
//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 09/12/20.
//  Copyright © 2020 BRRV. All rights reserved.
//

import Foundation
struct DummyModel {
    let dummyValue : Int
}

class DummyClass {
    private let model : DummyModel
    init(value : DummyModel) {
        model = value
    }
    
    func dummyFunc() -> Int {
        return model.dummyValue
    }
}
