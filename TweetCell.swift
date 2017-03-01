//
//  TweetCellTableViewCell.swift
//  TwitterClient
//
//  Created by my mac on 2/28/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    
  
    var tweet : Tweet!{
        didSet{
            profilePicture.setImageWith(tweet.profilePicUrl!)
            nameLabel.text = tweet.username!
            handleLabel.text = "@\(tweet.name!)"
            dateLabel.text = tweet.timestamp!.description
            tweetTextLabel.text = tweet.text!
            likeCount.text = "\(tweet.favoritesCount)"
            retweetCount.text = "\(tweet.retweetCount)"
            
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
