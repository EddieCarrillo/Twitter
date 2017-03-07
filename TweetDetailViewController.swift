//
//  TweetDetailViewController.swift
//  TwitterClient
//
//  Created by my mac on 3/5/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

 @IBOutlet var tweetView: TweetView!
    var tweet : Tweet?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetView.tweet = tweet!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! ProfileViewController
        vc.user = tweet?.tweetOwner!
        
        
        
    }
 

}
