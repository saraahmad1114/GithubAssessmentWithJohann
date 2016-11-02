//
//  GithubUserDataStore.swift
//  AssessmentGithub
//
//  Created by Flatiron School on 11/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class GithubUserDataStore {
    
    static let sharedInstance = GithubUserDataStore()
    private init() {}
    
    var githubUser: [GithubUser] = []
    
    func getAllGithubUserObjectswith (completion:(Bool)-> ()){
    
        GithubAPIClient.getUserGithubInformation { (githubUserDictionary) in
            
            let githubLogin = githubUserDictionary["login"] as? String
            
            guard let unwrappedGithubLogin = githubLogin else {print("ERROR"); return}
            
            let githubId = githubUserDictionary["id"] as? Double
            
            guard let unwrappedGithubId = githubId else {print("ERROR"); return}
            
            let avatarURL = githubUserDictionary["avatar_url"] as? String
            
            guard let unwrappedGithubAvatarURL = avatarURL else {print("ERROR "); return}
            
            let userURL = githubUserDictionary["url"] as? String
            
            guard let unwrappedUserURL = userURL else {print("ERROR"); return}
            
            let githubUserObject = GithubUser(avatarURL: unwrappedGithubAvatarURL, login: unwrappedGithubLogin, id: unwrappedGithubId, url: unwrappedUserURL)
            
            self.githubUser.append(githubUserObject)
            
            completion(true)
    
        }
    }

}
