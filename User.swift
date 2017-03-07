//
//  User.swift
//  TwitterClient
//
//  Created by my mac on 2/23/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var screenname: String?
    var profileUrl: URL?
    var tagline: String?
    var backgroundPictureUrl: URL?
    var dictionary: NSDictionary?
    var followerCount: Int = 0
    var tweetCount: Int = 0
    var followingCount: Int = 0
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        print(dictionary)
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString{
            profileUrl = URL(string: profileUrlString)
        }
        tagline = dictionary["description"] as? String
        let bgPicStrUrl = dictionary["profile_background_image_url_https"] as? String
        print(bgPicStrUrl)
        if let bgPicStrUrl = bgPicStrUrl{
            backgroundPictureUrl = URL(string: bgPicStrUrl)
        }
        
        followerCount = dictionary["followers_count"] as! Int
        followingCount = dictionary["friends_count"] as! Int
        tweetCount = dictionary["statuses_count"] as! Int
        
  
    
    }
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            
            if _currentUser == nil{
            let defaults = UserDefaults.standard
            
            let userData = defaults.object(forKey: "currentUserData") as? Data
            
            if let userData = userData{
                let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                
                _currentUser = User(dictionary:dictionary)
            }
        }
            
            return _currentUser
            
    }
        set(user){
            _currentUser = user
            let defaults = UserDefaults.standard
            
            
            if let user = user{
                let data = try!  JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                
                defaults.set(data, forKey: "currentUserData")
            }else{
                defaults.removeObject(forKey: "currentUserData")
            }
           
           
            defaults.synchronize()
        
        }

}

}
