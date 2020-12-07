//
//  AppleSearchResultViewModel.swift
//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 24/11/20.
//  Copyright © 2020 Nagarro. All rights reserved.
//

import Foundation
import UIKit

class AppleSearchResultViewModel {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    private var searchResult : Json4Swift_Base?
    
    func fetchRecords(search:String, completion:@escaping(_ success:Bool)->Void)  {
        if let searchString = search.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            
            let url = URL(string: "https://itunes.apple.com/search?term=\(searchString)")!
            
            let request = APIRequest(session: session)
            request.perform(for: url) { [weak self] (result: Result<Json4Swift_Base>) in
                switch result {
                case .success(let contact):
                    if let res = contact as? Json4Swift_Base {
                        self?.searchResult = res
                        completion(true)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            }
        }
    }
    
    var totalItem : Int {
        self.searchResult?.results?.count ?? 0
    }
    
    func artistName(at index:Int) -> String {
        return self.item(at: index)?.artistName ?? ""
    }
    
    func displayText(at index:Int) -> String {
        var string = ""
        
        if let item = self.item(at: index) {
            if let artistName = item.artistName {
                string = string + artistName
            }
            if let trackName = item.trackName {
                string = string + " : " + trackName
            }   
        }
        return string
    }
    
    func displayThumbnail(at index:Int, imageDownloader:ImageDownloaderProtocol = ImageDownloader.imageDownloader, onCompletion:@escaping(_ image: UIImage) -> Void) {
        if let item = self.item(at: index), let path = item.artworkUrl100 {
            imageDownloader.downloadImage(urlStr: path) { (image) in
                onCompletion(image ?? UIImage(named: "loading")!)
            }
        }
    }
    
    func item(at index:Int) -> Results? {
        guard let items = self.searchResult?.results else {
            return nil
        }
        guard items.count > index else {
            return nil
        }
        
        return items[index]
    }
}
