//
//  Tweet.swift
//  TwitterClient
//
//  Created by my mac on 2/23/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var tweetOwner : User?
    var text: String?
    var timestamp : String?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var username : String?
    var name : String?
    var profilePicUrl : URL?
    
    
    init(dictionary: NSDictionary){
        print(dictionary)
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        //Create a user from the tweet
        tweetOwner = User(dictionary: dictionary["user"] as! NSDictionary)
        
        name = tweetOwner?.name!
        username = tweetOwner?.screenname
  
        if let profileUrl = tweetOwner?.profileUrl{
            profilePicUrl = profileUrl
        }
        
        
        let timestampString = dictionary["created_at"] as? NSString
        if let timestampString = timestampString {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            let date = formatter.date(from: timestampString as String) as NSDate?
            formatter.dateFormat = "MM/dd/yy"
            timestamp = formatter.string(from: date as! Date)
        }
        
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        for dictionary in dictionaries{
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        
        }
        
        return tweets
    
    }

}
