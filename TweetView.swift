//
//  ProfileView.swift
//  TwitterClient
//
//  Created by my mac on 3/2/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class TweetView: UIView {
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var twitterHandle: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoritesCountLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    
    
    var tweet:Tweet!{
        didSet{
            profilePicture.setImageWith(tweet.profilePicUrl!)
            twitterHandle.text = tweet.username!
            username.text = "@\(tweet.name!)"
            tweetText.text = tweet.text!
            timestampLabel.text = tweet.timestamp!
            retweetCount.text = "\(tweet.retweetCount)"
            favoritesCountLabel.text = "\(tweet.favoritesCount)"
        
        }
    
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
