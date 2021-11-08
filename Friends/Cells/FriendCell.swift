//
//  FriendCell.swift
//  Friends
//
//  Created by Workspace Infotech on 8/11/21.
//

import UIKit

class FriendCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    var friend: Friend? {
        
        didSet {
            
            if let friend = friend {
                
                self.lblFullName.text = "\(String(describing: friend.name?.first)) \(String(describing: friend.name?.last))"
                
                self.lblCountry.text = friend.location?.country
                
                self.imgView.setImage(withImageId: friend.picture?.medium ?? "",  placeholderImage: #imageLiteral(resourceName: "placeholder"), size: .original)
                
                self.imgView.contentMode = .scaleToFill
            }
        }
    }
    
    
    
}
