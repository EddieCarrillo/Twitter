//
//  TweetsViewController.swift
//  TwitterClient
//
//  Created by my mac on 2/27/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var wasLiked  = false
    var wasRetweeted  = false
    
    
    var tweets: [Tweet]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 170
        
        //Twittter color
        let twitterBlue = UIColor(red: 0.0, green: 172.0/255.0, blue: 237.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = twitterBlue
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        TwitterClient.sharedInstance?.homeTimeline(sucess: { (tweets: [Tweet]) -> () in
            self.tweets = tweets
            
            self.tableView.reloadData()
            
        }, failure: { (error: Error) -> () in
            print("error: \(error.localizedDescription)")
        })
        
    }
    
  
    
    //Log the user out if pressed the log out button
    @IBAction func onLogoutButton(_ sender: Any) {
        TwitterClient.sharedInstance?.logout()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //display the total number of tweets in their own rows
        if let tweets = self.tweets {
            return tweets.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TweetCell = self.tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        let tweet = tweets[indexPath.row]
        cell.tweet = tweet
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func onRetweetPressed(_ sender: Any) {

        
        //Instantiate button, view, cell, and indexpath
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview?.superview as! TweetCell
        let indexPath = tableView.indexPath(for: cell)
        
        //Increment likes once user has tapped on retweet button
        self.tweets![indexPath!.row].favoritesCount = self.tweets![indexPath!.row].favoritesCount + 1
        
        
        
        //reload data
        self.tableView.reloadData()
        
        
    }
    @IBAction func onLikePressed(_ sender: Any) {
       
        
        print("called!!!")
        //Instantiate button, view, cell, and indexpath
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview?.superview as! TweetCell
        let indexPath = tableView.indexPath(for: cell)
        
        //Increment retweetCount once user has tapped on retweet button
        self.tweets![indexPath!.row].retweetCount = self.tweets![indexPath!.row].retweetCount + 1
        
      self.tableView.reloadData()
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
