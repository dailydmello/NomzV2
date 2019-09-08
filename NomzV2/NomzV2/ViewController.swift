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
        
        YelpClient.getBusinesses { (businesses) in
            guard let businesses = businesses else { return }
            print(businesses)
        }
    }


}

