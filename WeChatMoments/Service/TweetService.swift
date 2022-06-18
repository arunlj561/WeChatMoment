//
//  TweetService.swift
//  WeChatMoments
//


import Foundation
import PromiseKit

class TweetService {
    private var httpService: BaseService

    init() {
        self.httpService = HttpService()
    }

    func getTweets(_ userName: String) -> Promise<[Tweet]> {
        let url = UrlConstant.tweetsUrl(name: userName)
        return httpService.get(url: url).map { data in
            var tweets: [Tweet] = try JSONDecoder().decode([Tweet].self, from: data)
            tweets = tweets.filter({ $0.content != nil })
            return tweets
        }
    }
}
