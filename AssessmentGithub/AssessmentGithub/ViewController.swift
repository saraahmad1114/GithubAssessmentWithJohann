//
//  ViewController.swift
//  AssessmentGithub
//
//  Created by Flatiron School on 11/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let store = GithubUserDataStore.sharedInstance
    
    @IBOutlet weak var githubImage: UIImageView!
    
    @IBOutlet weak var loginLabel: UILabel!

    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var urlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.removeConstraints(self.view.constraints)
//        githubImage.translatesAutoresizingMaskIntoConstraints = false
//        githubImage.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
//        githubImage.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
//        githubImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.30).active = true
//        //githubImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
//        
//        loginLabel.translatesAutoresizingMaskIntoConstraints = false
//        loginLabel.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
//        loginLabel.topAnchor.constraintEqualToAnchor(self.githubImage.bottomAnchor, constant: 30).active = true
//       
//        idLabel.translatesAutoresizingMaskIntoConstraints = false
//        idLabel.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
//        idLabel.topAnchor.constraintEqualToAnchor(self.loginLabel.bottomAnchor, constant: 30).active = true
//        
//        urlLabel.translatesAutoresizingMaskIntoConstraints = false
//        urlLabel.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
//        urlLabel.topAnchor.constraintEqualToAnchor(self.idLabel.bottomAnchor, constant: 30).active = true
        
        store.getAllGithubUserObjectswith { (isTrue) in
            if isTrue {
                
             NSOperationQueue.mainQueue().addOperationWithBlock({
                if let avatarURL = self.store.githubUser[0].avatarURL {
                if let url = NSURL(string: avatarURL) {
                    if let data = NSData(contentsOfURL: url) {
                        self.githubImage.image = UIImage(data: data)
                        print("***************************")
                        print(avatarURL)
                        print("***************************")
                    }
                }
                }
                if let loginText = self.store.githubUser[0].login{
                    self.loginLabel.text = loginText
                    print("***************************")
                    print(loginText)
                    print("***************************")
                }
                
                if let idText = self.store.githubUser[0].id{
                    self.idLabel.text = String(idText)
                    print("***************************")
                    print(idText)
                    print("***************************")
                }
                
                if let urlText = self.store.githubUser[0].url{
                    self.urlLabel.text = urlText
                    print("***************************")
                    print(urlText)
                    print("***************************")
                }
             })
                
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

