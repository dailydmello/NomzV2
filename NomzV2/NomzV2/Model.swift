//
//  Model.swift
//  NomzV2
//
//  Created by Ethan D'Mello on 2019-09-05.
//  Copyright © 2019 Ethan D'Mello. All rights reserved.
//

import Foundation

struct Business: Codable {
    let name: String?
    let id: String?
}

struct YelpJSON: Codable {
    let businesses: [Business]
}

