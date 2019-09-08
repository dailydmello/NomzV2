//
//  YelpClient.swift
//  NomzV2
//
//  Created by Ethan D'Mello on 2019-09-05.
//  Copyright © 2019 Ethan D'Mello. All rights reserved.
//

import Foundation

enum HTTPHeaderFields: String {
    case authorization = "Authorization"
    case cacheControl = "Cache-Control"
    case apiKey = "Bearer gdZKkWA2rnjxQl3EAZx-EhdLNlWcds2PD6_5exVwwjEGX3LjYmmB6LrBQSdDa8nPJ1BEzXlVQFxassXubpwUN_58JZF7mek5MtTocSK5icJAhjRn2Ru1bPY1CVbiW3Yx"
    case noCache = "No-Cache"
}

class YelpClient {
    static let urlString = "https://api.yelp.com/v3/businesses/search?term=delis&latitude=37.786882&longitude=-122.399972"
    
    static func getBusinesses(completion: @escaping ([Business]?) -> Void){
        let session = URLSession(configuration: .ephemeral, delegate: .none, delegateQueue: .main)
        
        guard let url = URL(string: urlString) else {
            fatalError("URL could not be generated")
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
       
        urlRequest.httpMethod = "GET"
        
        let headers = [
            HTTPHeaderFields.authorization.rawValue: HTTPHeaderFields.apiKey.rawValue,
            HTTPHeaderFields.cacheControl.rawValue: HTTPHeaderFields.noCache.rawValue
        ]
        
        urlRequest.allHTTPHeaderFields = headers
        
        let task = session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print("data task error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                completion(nil)
                fatalError("data could not be generated")
                //return
            }
            let decoder = JSONDecoder()
            
            do{
                let yelpData = try decoder.decode(YelpJSON.self, from: data)
                completion(yelpData.businesses)
            } catch let error {
                print("error while decoding: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}

