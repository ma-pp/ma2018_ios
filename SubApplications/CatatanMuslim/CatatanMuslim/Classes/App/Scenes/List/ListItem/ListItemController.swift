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
        
        setupTableView()
    }
    
    
    let tableView = UITableView()
    
    private func setupTableView() {
        tableView.embed(in: view)
        tableView.allowsSelectionDuringEditing = false
    }
    
    func setupTableView(with setup: ListItemTableViewSetup) {
        setup.setupTableView(tableView)
    }
}
