//
//  Constants.swift
//  NomzV2
//
//  Created by Ethan D'Mello on 2019-09-05.
//  Copyright © 2019 Ethan D'Mello. All rights reserved.
//

import Foundation

struct K {
    struct YelpServer {
        static let baseUrl = "https://api.yelp.com"
    }
    
    static let APIKey = "Bearer gdZKkWA2rnjxQl3EAZx-EhdLNlWcds2PD6_5exVwwjEGX3LjYmmB6LrBQSdDa8nPJ1BEzXlVQFxassXubpwUN_58JZF7mek5MtTocSK5icJAhjRn2Ru1bPY1CVbiW3Yx"
    static let noCache = "No-Cache"
}

enum HTTPHeaderField: String {
    case authorization = "Authorization"
    case cacheControl = "Cache-Control"
//    static let APIHost = "https://api.yelp.com"
//    static let searchPath = "/v3/businesses/search?"
//    static let authorization = "authorization"
//    static let cacheControl = "Cache-Control"
//    static let noCache = "no-cache"
//    static let get = "GET"
//    static let endPointLimit = "limit=50"
//    static let endPointTerm = "term=food"
}
