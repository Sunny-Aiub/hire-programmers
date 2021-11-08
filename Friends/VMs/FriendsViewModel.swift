//
//  FriendsViewModel.swift
//  Friends
//
//  Created by Workspace Infotech on 8/11/21.
//


import UIKit

protocol FriendViewModelProtocol {
    
    var friendsDidChanges: ((Bool, Bool) -> Void)? { get set }
    
    func fetchAllFriends()
}

class FriendsViewModel: FriendViewModelProtocol {

    //MARK: - Internal Properties
    
    var friendsDidChanges: ((Bool, Bool) -> Void)?
    
    var friends: [Friend]? {
        didSet {
            self.friendsDidChanges!(true, false)
        }
    }
    
    func fetchAllFriends() {
        
        self.friends = [Friend]()
        
        FriendsAPIService.instance.fetchFriedns { result in
            
            switch result {
                
            case .success(let data):
                
                let mappedModel = try? JSONDecoder().decode(FriendsResponse.self, from: data) as FriendsResponse
                self.friends = mappedModel?.results ?? []
                break
                
            case .failure(let error):
                print(error.description)
            }
        }
    }
    
}
