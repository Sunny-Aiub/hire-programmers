//
//  ViewController.swift
//  Friends
//
//  Created by Workspace Infotech on 8/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let viewModel = FriendsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        prepareCollectionView()
        fetchMovieList()
    }
    
    
    func prepareUI()  {
        prepareViewModelObserver()
        
    }
    
    func prepareCollectionView()  {
        
        self.view.backgroundColor = .white
        self.myCollectionView.dataSource = self
        self.myCollectionView.delegate = self
        self.myCollectionView.register(UINib(nibName: "FriendCell", bundle: nil), forCellWithReuseIdentifier: "FriendCell")
    }
    
}


extension ViewController {
    
    func fetchMovieList() {
        viewModel.fetchAllFriends()
    }
    
    func prepareViewModelObserver() {
        self.viewModel.friendsDidChanges = { (finished, error) in
            if !error {
                self.reloadTableView()
            }
        }
    }
    
    func reloadTableView() {
        self.myCollectionView.reloadData()
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.friends?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as? FriendCell else{
            fatalError("Cell not found")
        }
        
        let data = viewModel.friends![indexPath.row]
        cell.friend = data
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let data = viewModel.friends![indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVc") as! DetailsVc
        vc.friendData = data
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.myCollectionView.frame.width / 3 - 16
        let height = 200.0
        
        return CGSize(width: width, height: height)
        
    }
}
