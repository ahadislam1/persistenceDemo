//
//  ViewController.swift
//  doucmentsDirecitory
//
//  Created by Ahad Islam on 12/5/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let manager = DataManager<Restaurant>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dump(manager.getItems())
        manager.addItem(item: Restaurant(name: "Chicken", rating: -2, hours: "no"))
        dump(manager.getItems())
        manager.deleteItem(atIndex: 0, item: Restaurant(name: "Chicken", rating: -2, hours: "no"))
        dump(manager.getItems())
    }


}

