//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Martin Kuchar on 2020-05-11.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class FoodTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
         super.viewDidLoad()
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.de
        return cell
    }

}
