//
//  ComposeTweetView.swift
//  TwitterClient
//
//  Created by my mac on 3/6/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ComposeTweetView: UIView {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var twitterHandleLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var newTweetTextField: UITextField!
    
    
    var user : User!{
        didSet{
            usernameLabel.text = user.name!
            twitterHandleLabel.text = "@\(user.screenname!)"
            profilePicture.setImageWith(user.profileUrl!)
        
        }
    
    }

}
