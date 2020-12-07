//
//  APIRequest.swift
//  HackerNews
//
//  Created by Rajneesh on 30/11/20.
//  Copyright © 2020 Nagarro. All rights reserved.

/*
This class will be used to make API Call and parse results.
 Its will return the result in seccess and failure enum
*/

import Foundation

enum Result<T: Codable> {
    case success(result: Decodable?)
    case failure(error: Error)
}

class APIRequest {
    
    private let session: URLSessionProtocol
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func perform<T: Decodable>(for url:URL, with completion: @escaping (Result<T>) -> Void) {
        
        let httpClient = HttpClient(session: session)
        
        httpClient.get(url: url) { (data, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error: error!))
                }
                return
            }
            guard let data = data else {
                completion(.success(result: nil))
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result: responseObject))
                }
            } catch let exception {
                print("Exception \(exception)")
                completion(.success(result: nil))
            }
        }
    }
    
    func downloadItem(for url:URL, with completion: @escaping (Data?) -> Void) {
        let httpClient = HttpClient(session: session)
        httpClient.get(url: url) { (data, error) in
            completion(data)
        }
    }
}
