//
//  ProfileViewController.swift
//  TwitterClient
//
//  Created by my mac on 3/5/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var user: User?
    var tweets : [Tweet]?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var profileView: ProfileView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let twitterClient  = TwitterClient.sharedInstance
        twitterClient?.getUserTimeline(user: user!, sucess: { (tweets : [Tweet]) in
             self.tweets = tweets
            for tweet in tweets{
             print(tweet.text!)
            }
            self.tableView.reloadData()
        }, failure: { (error : Error) in
            print(error.localizedDescription)
        })
        profileView.user = user!
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let tweets = self.tweets{
            return tweets.count
        }
        return 0
    }
    
    
  
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTweetCell") as!ProfileTweetCell
        
        cell.tweet = tweets?[indexPath.row]
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
