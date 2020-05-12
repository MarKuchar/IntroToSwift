//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Martin Kuchar on 2020-05-11.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation
import UIKit

class FoodTableViewController: UITableViewController {
    let taco = Food(description: "Corn and meat", name: "Taco")
    let nacho = Food(description: "Chips and cheese", name: "Nacho")
    let chili = Food(description: "Chili and meat", name: "Chili con carne")
    let halusky = Food(description: "Potatos and cheese", name: "Halusky")
    let sandwich = Food(description: "Meat and bread", name: "Sandwich")
    let hamburger = Food(description: "Meat and bread", name: "Hamburger")
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "foodCell")
    }
    
    var meals: [Meal]  {
        let breakfast = Meal(food: [taco, nacho], name: "Breakfast")
        let lunch = Meal(food: [chili, halusky], name: "Lunch")
        let dinner = Meal(food: [sandwich, hamburger], name: "Dinner")
        return [breakfast, lunch, dinner]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        let food = meals[indexPath.section].food[indexPath.row]
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
