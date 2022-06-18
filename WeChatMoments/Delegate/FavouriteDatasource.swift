//
//  FavouriteDatasource.swift
//  WeChatMoments
//
//  Created by Arun Jangid on 18/06/22.
//

import Foundation
import UIKit
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
        cell.textLabel?.text = favourites?[indexPath.row]
        return cell
    }
}
