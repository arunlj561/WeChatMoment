//
//  FavouriteViewController.swift
//  WeChatMoments
//
//  Created by Arun Jangid on 18/06/22.
//

import UIKit

class FavouriteViewController: UITableViewController {

    class func getFavouriteViewController() -> FavouriteViewController?{
        
        let vc = FavouriteViewController(nibName: "FavouriteViewController", bundle: Bundle.main)
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


extension UserDefaults{
    func addToFavourites(tweet:String){
        if var values = UserDefaults.standard.value(forKey: Constants.FAVOURITES) as? [String]{
            values.append(tweet)
            UserDefaults.standard.set(values, forKey: Constants.FAVOURITES)
        }else{
            UserDefaults.standard.set([tweet], forKey: Constants.FAVOURITES)
        }        
    }
}

class FavouriteDatasource: NSObject, UITableViewDataSource {
    private var cellIdentifier: String
    

    var favourites: [String]?

    init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
        if let favourites = UserDefaults.standard.value(forKey: Constants.FAVOURITES) as? [String] {
            self.favourites = favourites
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let favourites = self.favourites else { return 0 }
        return favourites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)

        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: self.cellIdentifier)
        }
        cell.textLabel?.text = favourites?[indexPath.row]
        return cell
    }
}
