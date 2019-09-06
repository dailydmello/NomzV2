//
//  YelpClient.swift
//  NomzV2
//
//  Created by Ethan D'Mello on 2019-09-05.
//  Copyright © 2019 Ethan D'Mello. All rights reserved.
//

import Foundation
import Alamofire

class YelpClient {
    static func getRestaurants(completion:@escaping (Result<[Restaurant], AFError>)->Void) {
        AF.request(APIRouter.getRestaurants)
            .responseDecodable { (response: DataResponse<[Restaurant], AFError>) in
                completion(response.result)
        }
    }
}

