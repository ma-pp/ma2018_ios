//
//  ViewController.swift
//  CommonApp
//
//  Created by PondokiOS on 11/4/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit
import Common

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupPagedScroll()
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
    }
    
    private lazy var pagedScroll = PagedScroller(scrollView: tableView)
    private func setupPagedScroll() {
        pagedScroll.preparePage { [unowned self](pagePrepared) in
            self.dataSource.paginate {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    pagePrepared()
                }
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource.items[indexPath.row]
        return cell
    }
}

class DataSource {
    private var page = 1
    let dataCount = 20
    
    var displayedDataCount: Int { return page * dataCount }
    
    var items: [String] { return (1...displayedDataCount).map({ "Cell \($0)" }) }
    
    func paginate(completion: @escaping () -> Void) {
        // Simulate Network Async Operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.page += 1
            completion()
        }
    }
}

