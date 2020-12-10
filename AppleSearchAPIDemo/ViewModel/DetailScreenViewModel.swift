//
//  DetailScreenViewModel.swift
//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 30/11/20.
//  Copyright © 2020 Nagarro. All rights reserved.
//

import Foundation

class DetailScreenViewModel {
    private let result : Results
    
    init(result : Results) {
        self.result = result
    }
    
    var mediaString : String? {
        return result.previewUrl
    }
    
    func dummyFunc() -> String {
        return "Raj"
    }
    
    // ** Track name as Detail screen title
    var title : String {
        if let text = result.trackName {
            return text
        }
        return "Detail Screen"
    }
    
    // ** To get/download data for track
    func mediaData(session:URLSessionProtocol = URLSession.shared, onCompletion:@escaping(_ data: Data) -> Void) {
        if let mediaStr = mediaString, let url = URL(string: mediaStr) {
            let request = APIRequest(session: session)
            request.downloadItem(for: url) { data in
                if let data = data {
                    DispatchQueue.main.async(execute: {
                        onCompletion(data)
                    })
                }}
        }
    }
}
