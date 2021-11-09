//
//  DetailsVc.swift
//  Friends
//
//  Created by Workspace Infotech on 9/11/21.
//

import UIKit

class DetailsVc: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    var friendData : Friend?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareDataWithUI()
        addTapGesture()
    }
    
    
    func prepareDataWithUI(){
        
        self.imgView.setImage(withImageId: self.friendData?.picture?.large! ?? "",  placeholderImage: #imageLiteral(resourceName: "placeholder"), size: .original)
        
        guard let first = self.friendData?.name?.first else{ return}
        guard let last = self.friendData?.name?.last else{ return}
        
        self.lblName.text =  "\(first) \(last)"
        
        guard let stNmbr = self.friendData?.location?.street?.number else{ return}
        
        guard let sName = self.friendData?.location?.street?.name else{ return}
        
        guard let city = self.friendData?.location?.city else{ return}
        guard let state = self.friendData?.location?.state else{ return}
        guard let country = self.friendData?.location?.country else{ return}
        
        self.lblAddress.text = "\(stNmbr), \(sName), \(city), \(state), \(country) "
        
        if let email = self.friendData?.email{
            self.lblEmail.text = email
        }
        
        if let phone = self.friendData?.phone{
            self.lblPhone.text = phone
        }
        
        
    }
    
    
    
    
}

extension DetailsVc {
    func addTapGesture()  {
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailsVc.tapFunction))
        self.lblEmail.addGestureRecognizer(tap)
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
        if let url = URL(string: "mailto:\(self.lblEmail.text ?? "")") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }

    }
}
