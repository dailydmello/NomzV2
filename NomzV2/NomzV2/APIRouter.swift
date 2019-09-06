//
//  APIRouter.swift
//  NomzV2
//
//  Created by Ethan D'Mello on 2019-09-05.
//  Copyright © 2019 Ethan D'Mello. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getRestaurants
    case posts
    case post(id: Int)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getRestaurants:
            return .get
        case .posts, .post:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getRestaurants:
            return "/businesses/search?"
        case .posts:
            return "/posts"
        case .post(let id):
            return "/posts/\(id)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getRestaurants:
            return nil
        case .posts, .post:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try "https://api.yelp.com/v3/businesses/search?term=delis&latitude=37.786882&longitude=-122.399972".asURL()
        
        //var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        var urlRequest = URLRequest(url: url)
        
        //HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(K.APIKey, forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)
        urlRequest.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        
        //Parameters
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }        
        return urlRequest
    }
    
    
}
