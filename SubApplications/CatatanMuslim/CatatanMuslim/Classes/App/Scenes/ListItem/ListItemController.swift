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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupTableView()
        setupTabBar()
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Hello"
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        
        setupSearchBar()
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
    }
    
    private lazy var tabBar: SimpleTabBar = {
        return UIView.load(type: SimpleTabBar.self)!
    }()
    
    private let badgeSetting = (
        size: CGFloat(7.5),
        padding: (
            top: CGFloat(3),
            right: CGFloat(3)
        )
    )
    
    private let toggleUnreadButton = BadgedButton()
    private func setupToggleUnreadButton() {
        toggleUnreadButton.setTitle("Unread", for: .normal)
        toggleUnreadButton.setTitleColor(.black, for: .normal)
        let btn = toggleUnreadButton
        btn.badge.size = badgeSetting.size
        btn.badge.topPadding = badgeSetting.padding.top
        btn.badge.rightPadding = badgeSetting.padding.right
    }
    
    private let toggleGridButton = UIButton()
    private func setupToggleGridButton() {
        toggleGridButton.setTitle("Grid", for: .normal)
        toggleGridButton.setTitleColor(.black, for: .normal)
    }
    
    private let showDiscussionButton = BadgedButton()
    private func setupShowDiscussionButton() {
        showDiscussionButton.setTitle("Discuss", for: .normal)
        showDiscussionButton.setTitleColor(.black, for: .normal)
        let btn = showDiscussionButton
        btn.badge.size = badgeSetting.size
        btn.badge.topPadding = badgeSetting.padding.top
        btn.badge.rightPadding = badgeSetting.padding.right
        
    }
    
    private func setupTabBar() {
        tabBar.addButton(toggleUnreadButton)
        tabBar.addButton(toggleGridButton)
        tabBar.addButton(showDiscussionButton)
        
        // See XIB!
        let tabBarViewHeight: CGFloat = 70
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBar)
        view.bringSubview(toFront: tabBar)
        tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabBar.heightAnchor.constraint(equalToConstant: tabBarViewHeight).isActive = true
        
        setupToggleUnreadButton()
        setupToggleGridButton()
        setupShowDiscussionButton()
    }
    
}
