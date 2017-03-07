//
//  ProfileView.swift
//  TwitterClient
//
//  Created by my mac on 3/2/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet weak var backgroundProfilePicture: UIImageView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var tweetCount: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    
    var user : User! {
        didSet{
            backgroundProfilePicture.setImageWith(user.backgroundPictureUrl!)
            profilePicture.setImageWith(user.profileUrl!)
            tweetCount.text = "\(user.tweetCount)"
            usernameLabel.text = user.name!
            followingCountLabel.text = "\(user.followingCount)"
            followerCountLabel.text = "\(user.followerCount)"
            handleLabel.text = user.screenname!
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
