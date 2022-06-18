//
//  UserDefaults.swift
//  WeChatMoments
//
//  Created by Arun Jangid on 18/06/22.
//

import Foundation
extension UserDefaults{
    func addToFavourites(tweet:String){
        if var values = UserDefaults.standard.value(forKey: Constants.FAVOURITES) as? [String]{
            if !values.contains(where: { $0 == tweet }){
                values.append(tweet)
            }
            UserDefaults.standard.set(values, forKey: Constants.FAVOURITES)
        }else{
            UserDefaults.standard.set([tweet], forKey: Constants.FAVOURITES)
        }
    }
}
