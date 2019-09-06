//
//  ViewController.swift
//  NomzV2
//
//  Created by Ethan D'Mello on 2019-09-05.
//  Copyright © 2019 Ethan D'Mello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        YelpClient.getRestaurants { result in
            switch result {
            case .success(let restaurants):
                print(restaurants)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }


}

