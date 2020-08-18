//
//  SushiTableViewController.swift
//  SushiLoverDemo
//
//  Created by Derrick Park on 8/18/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class SushiTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  private var tableView: UITableView!
  
  private let cellId = "SushiCell"
  private var sushis: [Sushi] = Sushi.sushis()
  private var filteredSushis: [Sushi] = []
  private let searchController = UISearchController(searchResultsController: nil)
  
  private var searchFooter: SearchFooter!
  private var searchFooterBottomConstraint: NSLayoutConstraint!
  
  private var isSearchBarEmpty: Bool {
    return searchController.searchBar.text?.isEmpty ?? true
  }
  
  private var isFiltering: Bool {
    return searchController.isActive && (!isSearchBarEmpty || searchController.searchBar.selectedScopeButtonIndex != 0)
  }
  
  // MARK: - view controller lifecylce
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    /// Navigation Title
    let titleImageView = UIImageView(image: UIImage(named: "banner"))
    titleImageView.contentMode = .scaleAspectFit
    titleImageView.constraintWidth(equalToConstant: 150, heightEqualToConstant: 33)
    navigationItem.titleView = titleImageView
    
    /// TableView
    setupTableView()
    
    /// SearchBar
    setupSearchController()
    setupSearchFooter()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.prefersLargeTitles = false
  }
  
  // MARK: - helper
  
  private func setupTableView() {
    tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(SushiSubtitleCell.self, forCellReuseIdentifier: cellId)
    view.addSubview(tableView)
    tableView.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor)
  }
  
  private func setupSearchController() {
    navigationItem.searchController = searchController
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Sushi"
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    // ensure that the search bar doesn't remain on the screen if the user navigates to another view controller while the UISearchController is active
    definesPresentationContext = true
    
    searchController.searchBar.scopeButtonTitles = Sushi.Category.allCases.map { $0.rawValue }
    
    let notificationCenter = NotificationCenter.default
    notificationCenter.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) {
      self.handleKeyboard(notification: $0)
    }
    notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) {
      self.handleKeyboard(notification: $0)
    }
  }
  
  private func setupSearchFooter() {
    searchFooter = SearchFooter()
    view.addSubview(searchFooter)
    searchFooter.constraintHeight(equalToConstant: 44)
    let constraints = searchFooter.anchors(topAnchor: nil, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: view.bottomAnchor)
    searchFooterBottomConstraint = constraints.bottom
  }
  
  private func filterSuhsiFor(searchText: String, category: Sushi.Category? = nil) {
    filteredSushis = sushis.filter { (sushi) in
      let isCategoryMatching = category == .all || category == sushi.category
      if isSearchBarEmpty {
        return isCategoryMatching
      } else {
        return isCategoryMatching && sushi.name.lowercased().contains(searchText.lowercased())
      }
    }
    
    isFiltering ? searchFooter.isFilteringToShow(filteredItemCount: filteredSushis.count, of: sushis.count) : searchFooter.isNotFiltering()
    
    tableView.reloadData()
  }
  
  private func handleKeyboard(notification: Notification) {
    guard notification.name == UIResponder.keyboardDidShowNotification else {
      // keyboardWillHideNotification
      searchFooterBottomConstraint.constant = 0
      view.layoutIfNeeded()
      return
    }
    // keyboardDidShowNotification
    guard
      let info = notification.userInfo,
      let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
      else { return }
    
    let keyboardHeight = keyboardFrame.cgRectValue.size.height
    
    self.searchFooterBottomConstraint.constant = -keyboardHeight
    UIView.animate(withDuration: 0.1) {
      self.view.layoutIfNeeded()
    }
  }
  
  // MARK: - Table view data source
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return isFiltering ? filteredSushis.count : sushis.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SushiSubtitleCell
    let sushi = isFiltering ? filteredSushis[indexPath.row] : sushis[indexPath.row]
    cell.textLabel?.text = sushi.name
    cell.detailTextLabel?.text = sushi.category.rawValue
    return cell
  }
  
  // MARK: - Table view delegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let sushiDetailVC = SushiDetailViewController()
    sushiDetailVC.sushi = isFiltering ? filteredSushis[indexPath.row] : sushis[indexPath.row]
    navigationController?.pushViewController(sushiDetailVC, animated: true)
  }
  
}

// MARK: - UISearchResultsUpdating

extension SushiTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    let category = Sushi.Category(rawValue: searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
    filterSuhsiFor(searchText: searchBar.text!, category: category)
  }
}

extension SushiTableViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    let category = Sushi.Category(rawValue: searchBar.scopeButtonTitles![selectedScope])
    filterSuhsiFor(searchText: searchBar.text!, category: category)
  }
}

