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
                
                self.lblFullName.text = "\(friend.name?.first ?? "") \(friend.name?.last ?? "")"
                
                self.lblCountry.text = friend.location?.country
                
                self.imgView.setImage(withImageId: friend.picture?.large! ?? "",  placeholderImage: #imageLiteral(resourceName: "placeholder"), size: .original)
                
                self.imgView.contentMode = .scaleAspectFit
            }
        }
    }
    
    
    
}
