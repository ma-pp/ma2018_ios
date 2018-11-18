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
        setupTabBar()
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
            self.navigationController?.navigationBar.prefersLargeTitles = true
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
    
    
    private var listNavController: ListNavigationController {
        guard let nav = navigationController as? ListNavigationController else {
            fatalError()
        }
        return nav
    }
    
    private var tabBar: SimpleTabBar {
        return listNavController.tabBar
    }
    
    private var toggleUnreadButton: BadgedButton {
        return listNavController.toggleUnreadButton
    }
    
    private var toggleGridButton: UIButton {
        return listNavController.toggleGridButton
    }
    
    private var showDiscussionButton: BadgedButton {
        return listNavController.showDiscussionButton
    }
    
    private var newButton: UIButton {
        return tabBar.newButton
    }
    
    private func setupTabBar() {
        newButton.addTarget(self, action: #selector(newItem), for: .touchUpInside)
        toggleUnreadButton.addTarget(self, action: #selector(filterUnread), for: .touchUpInside)
        toggleGridButton.addTarget(self, action: #selector(toggleGrid), for: .touchUpInside)
        showDiscussionButton.addTarget(self, action: #selector(showDiscussion), for: .touchUpInside)
    }
    
    @objc
    private func filterUnread() {
        
    }
    
    @objc
    private func toggleGrid() {
        
    }
    
    @objc
    private func showDiscussion() {
        
    }
    
    @objc
    private func newItem() {
        navigator.makeNewItem()
    }
}
