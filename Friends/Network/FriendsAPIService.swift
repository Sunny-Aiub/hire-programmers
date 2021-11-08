//
//  FriendsAPIService.swift
//  Friends
//
//  Created by Workspace Infotech on 8/11/21.
//


import UIKit

class FriendsAPIService: NSObject, Requestable {

    static let instance = FriendsAPIService()
    
 
    public var friends: [Friend]?

    
    func fetchFriedns(callback: @escaping Handler) {
        
        request(method: .get, url: Domain.baseUrl() + APIEndpoint.api) { (result) in
            
           callback(result)
        }
        
    }
    
    
}
