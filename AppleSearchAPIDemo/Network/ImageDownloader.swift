//
//  ImageDownloader.swift
//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 30/11/20.
//  Copyright © 2020 Nagarro. All rights reserved.
//

import UIKit

protocol ImageDownloaderProtocol {
    func downloadImage(urlStr:String, onCompletion:@escaping (UIImage?)->Void)
}

class ImageDownloader: NSObject,ImageDownloaderProtocol {
    static var imageDownloader = ImageDownloader()
    var imageCache = NSCache<NSString, AnyObject>()
    
    override init() {
        super.init()
        imageCache.countLimit = 500
        NotificationCenter.default.addObserver(self, selector: #selector(clearCache), name: UIApplication.didReceiveMemoryWarningNotification, object: nil)
    }
    
    func downloadImage(urlStr:String, onCompletion:@escaping (UIImage?)->Void) {
        
        if let url = URL(string: urlStr) {
            if let imageFromCache = imageCache.object(forKey: urlStr as NSString) as? UIImage {
                onCompletion(imageFromCache)
                return
            }
            DispatchQueue.global(qos: .background).async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        if let img = UIImage(data: data) {
                            self.imageCache.setObject(img, forKey: urlStr as NSString)
                            onCompletion(img)
                        } else {
                            onCompletion(nil)
                        }
                    }
                    
                } else {
                    onCompletion(nil)
                }
            }
        }
    }
    
    @objc func clearCache() {
        imageCache.removeAllObjects()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didReceiveMemoryWarningNotification, object: nil)
    }

}
