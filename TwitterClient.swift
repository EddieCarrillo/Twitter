//
//  TwitterClient.swift
//  TwitterClient
//
//  Created by my mac on 2/27/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


class TwitterClient: BDBOAuth1SessionManager {
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((Error)->())?
    
    
    static let sharedInstance = TwitterClient(baseURL: URL(string: "https://api.twitter.com")! , consumerKey: "hVQQ9kHseRNEOhVOsOqPeTXfY", consumerSecret: "6oHbCoKAZsz64CGSisAwZyQShq4TXomNupeBh3wk0jQMWXP1EW")



  func homeTimeline(sucess: @escaping (([Tweet]) -> ()), failure : @escaping (Error) -> ()){
        let twitterClient = TwitterClient.sharedInstance
        twitterClient?.get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success : { (task: URLSessionDataTask, response: Any?) -> Void in
            let dictionaries = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries: dictionaries)
            
            sucess(tweets)
            
            
            //   print("account: \(userDictionary)")
        },
                           failure: {(task: URLSessionDataTask?, error: Error) -> Void in
                            failure(error)
        })

    }

    func currentAccount(success: @escaping (User) -> (), failure: @escaping (Error)->()){
        let twitterClient = TwitterClient.sharedInstance
        twitterClient?.get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success : { (task: URLSessionDataTask, response: Any?) -> Void in
            let userDictionary = response as! NSDictionary
            let user = User(dictionary : userDictionary)
            print(user.name!)
            print(user.screenname)
            print(user.tagline)
            success(user)
            
            //   print("account: \(userDictionary)")
        },
                           failure: {(task: URLSessionDataTask?, error: Error) -> Void in
                            failure(error)
        })
        
}
    
    func handleOpenUrl(url: URL){
        let twitterClient = TwitterClient.sharedInstance
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        twitterClient?.fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (requestToken: BDBOAuth1Credential?) in
            
            self.currentAccount(success: { (user: User) in
                User.currentUser = user
                print("succesfully recieved access token")
                self.loginSuccess?()
                
            }, failure: {(error: Error) -> () in
            
            })
            
           
            
        }, failure: { (error: Error?) in
            print("error: \(error?.localizedDescription)")
            self.loginFailure?(error!)
        })
        
      
    }
    
    
    func logout(){
        User.currentUser = nil
        deauthorize()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UserDidLogOut"), object: nil)
    }
        
    
    
    func login(success: @escaping ()->(), failure: @escaping (Error) -> ()){
        loginSuccess = success
        loginFailure = failure
        
        let twitterClient = TwitterClient.sharedInstance
        //Kinda buggy if you do not logout before
        twitterClient?.deauthorize()
        //Make a request for a token that get's permission to go to authorization page
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "mytwitterdemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential?) -> Void in
            if let token = requestToken?.token{
                //If there is a request token use it to get the authorization token
                let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(token)")!
                //Should open safari
                UIApplication.shared.openURL(url)
                
            }
            
            
            print("I got a token")
        }, failure: { (error: Error?) -> Void in
            print("I got an error: \(error?.localizedDescription)")
            self.loginFailure?(error!)
        })
    
    }


}
    
