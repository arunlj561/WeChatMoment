//
//  FavouriteListTableViewController.swift
//  WeChatMoments
//
//  Created by Arun Jangid on 18/06/22.
//

import UIKit

class FavouriteListTableViewController: UITableViewController {
        
    
    class func getFavouriteViewController() -> FavouriteListTableViewController?{
        
        let vc = FavouriteListTableViewController(nibName: "FavouriteListTableViewController", bundle: Bundle.main)
        return vc
    }
    
    private var datasource : FavouriteDatasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupTableView()
    }

    
    func setupTableView() {
        self.datasource = FavouriteDatasource(cellIdentifier: "FavouriteTableViewCell")
        

        self.tableView = UITableView(frame: self.view.bounds, style: .grouped)
        self.tableView.dataSource = self.datasource
        self.tableView.delegate = self
        self.tableView.allowsSelection = false
        self.tableView.showsVerticalScrollIndicator = false

        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .white

        self.tableView.estimatedRowHeight = 0
        self.tableView.estimatedSectionHeaderHeight = 0
        self.tableView.estimatedSectionFooterHeight = 0

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FavouriteTableViewCell")
        self.tableView.separatorStyle = .none
    }
    
}



