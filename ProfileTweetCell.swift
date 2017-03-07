//
//  ProfileCellTableViewCell.swift
//  TwitterClient
//
//  Created by my mac on 3/5/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ProfileTweetCell: UITableViewCell {

    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    var tweet : Tweet!{
        
        didSet{
            profilePicture.setImageWith(tweet.profilePicUrl!)
            handleLabel.text = "@\(tweet.username!)"
            usernameLabel.text = "\(tweet.name!)"
            dateLabel.text = tweet.timestamp!.description
            tweetTextLabel.text = tweet.text!

            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
