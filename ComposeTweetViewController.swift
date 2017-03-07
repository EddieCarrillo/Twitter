//
//  ComposeTweetViewController.swift
//  TwitterClient
//
//  Created by my mac on 3/6/17.
//  Copyright © 2017 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController {
    
    var user: User?
    weak var delegate: SaveTweetViewControllerDelegate?

    @IBAction func onTweetButtonPressed(_ sender: Any) {
        delegate?.didTweet()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func onCancelButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBOutlet var composeTweetView: ComposeTweetView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TwitterClient.sharedInstance?.currentAccount(success: { (user: User) in
            self.composeTweetView.user = user
        }, failure: { (error: Error) in
            print(error)
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

protocol SaveTweetViewControllerDelegate: class{
    func didTweet()
    func didCancelTweet()

}
