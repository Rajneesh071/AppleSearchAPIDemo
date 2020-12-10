//
//  MokeImageDownloader.swift
//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 09/12/20.
//  Copyright © 2020 BRRV. All rights reserved.
//

import Foundation
import UIKit
@testable import AppleSearchAPIDemo

class MokeImageDownloader: ImageDownloaderProtocol {
    var dummyImage : UIImage? = nil
    func downloadImage(urlStr: String, onCompletion: @escaping (UIImage?) -> Void) {
        onCompletion(dummyImage)
    }
}
