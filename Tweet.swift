//
//  Tweet.swift
//  TwitterClient
//
//  Created by my mac on 2/23/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class Tweet: NSObject {
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
        favoritesCount = (dictionary["favorites_count"] as? Int) ?? 0
        
        //Create a user from the tweet 
        
        let user = dictionary["user"] as! NSDictionary
        name = user["screen_name"] as? String
        username = user["name"] as? String
        
        let profileUrlString = user["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString{
            profilePicUrl = URL(string: profileUrlString)
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
