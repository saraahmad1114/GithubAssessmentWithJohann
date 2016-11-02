//
//  GithubAPIClient.swift
//  AssessmentGithub
//
//  Created by Flatiron School on 11/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class GithubAPIClient
{

    class func getUserGithubInformation (completion:(NSDictionary)-> ()){
        
    var jsonInformationDictionary: NSDictionary = [:]
    
    let url = "https://api.github.com/user?access_token=\(Secrets.accesstoken)"
        
    let nsURL = NSURL(string: url)
        
    guard let unwrappedNSurl = nsURL else {print("ERROR"); return}
        
    let request = NSURLRequest(URL: unwrappedNSurl)
        
    let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) {data,response,error in
            
            guard let unwrappedData = data else {print("Error occured here"); return}
            
            let jsonDictionary = try! NSJSONSerialization.JSONObjectWithData(unwrappedData, options: []) as! NSDictionary

            jsonInformationDictionary = jsonDictionary
        
           completion(jsonInformationDictionary)
        }
    
        task.resume()
    }

}



