//
//  ListItemController.swift
//  CatatanMuslimApp
//
//  Created by PondokiOS on 11/6/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

public class ListItemController: UIViewController {
    
    var presenter: ListItemPresenter!
    var navigator: ListItemNavigator!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = presenter.title
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        editButtonItem.target = self
        editButtonItem.action = #selector(toggleEditing)
        navigationItem.rightBarButtonItem = editButtonItem
        
        setupSearchBar()
    }
    
    @objc
    private func toggleEditing() {
        isEditing = !isEditing
        tableView.isEditing = isEditing
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private func setupSearchBar() {
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            navigationItem.titleView = searchController.searchBar
        }
    }
    
    let tableView = UITableView()
    
    private func setupTableView() {
        tableView.embed(in: view)
        tableView.allowsSelectionDuringEditing = false
    }
    
    func setupTableView(with setup: ListItemTableViewSetup) {
        setup.setupTableView(tableView)
    }
    
    private var tabBar: SimpleTabBar {
        guard let nav = navigationController as? ListNavigationController else {
            fatalError()
        }
        return nav.tabBar
    }
    
    
}
