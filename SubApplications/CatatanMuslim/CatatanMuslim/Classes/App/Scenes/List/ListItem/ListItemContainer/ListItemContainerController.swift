//
//  ListItemContainerController.swift
//  CatatanMuslim
//
//  Created by PondokiOS on 11/16/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

class ListItemContainerController: UIViewController {
    private var listItemController: ListItemController!
    
    convenience init(listItemController: ListItemController) {
        self.init()
        self.listItemController = listItemController
    }
    
    var navigator: ListItemContainerNavigator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildController()
        setupNavigationBar()
    }
    
    private func setupChildController() {
        addChildViewController(listItemController)
        listItemController.view.frame = view.bounds
        view.addSubview(listItemController.view)
        listItemController.didMove(toParentViewController: self)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = listItemController.presenter.title
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
        } else {
            // Fallback on earlier versions
        }
        
        editButtonItem.target = self
        editButtonItem.action = #selector(toggleEditing)
        navigationItem.rightBarButtonItem = editButtonItem
        
        navigationController?
            .navigationBar
            .configure(with: .solid(.white))
        
        setupSearchBar()
    }
    
    @objc
    private func toggleEditing() {
        isEditing = !isEditing
        listItemController.tableView.isEditing = isEditing
    }
    
    private let searchController = UISearchController(
        searchResultsController: nil
    )
    
    private func setupSearchBar() {
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            navigationItem.titleView = searchController.searchBar
        }
    }
    
}

extension ListItemContainerController: ListNavTabBarResponder {
    func toggleUnread() {
        
    }
    
    func toggleGrid() {
        
    }
    
    func showDiscussion() {
        
    }
    
    func makeNewItem() {
        navigator.makeNewItem()
    }
    
    
}
