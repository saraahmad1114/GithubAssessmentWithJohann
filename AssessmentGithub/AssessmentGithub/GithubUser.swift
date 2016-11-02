//
//  GithubUser.swift
//  AssessmentGithub
//
//  Created by Flatiron School on 11/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class GithubUser{

    var avatarURL: String?
    var login: String?
    var id: Double?
    var url: String?
    
    init(avatarURL: String, login: String, id: Double, url: String) {
    self.avatarURL = avatarURL
    self.login = login
    self.id = id
    self.url = url
    }


}
