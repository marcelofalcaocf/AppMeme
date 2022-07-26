//
//  MemeViewController.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 26/07/22.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseCore

class MemeViewController: UIViewController {
    
    var memeViewModel: MemeViewModel = .init()
    
    @IBOutlet weak var posterUserImageView: UIImageView!
    @IBOutlet weak var greetings: UILabel!
    @IBOutlet weak var memeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener { auth, user in
            self.configureUser()
        }
        
        memeViewModel.getMemes()
        
        memeCollectionView.dataSource = self
        memeViewModel.delegate = self
    }
    
    func configureUser() {
            posterUserImageView.kf.setImage(with: memeViewModel.getUserImage)
            greetings.text = memeViewModel.getUserName

    }
    
}

extension MemeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memeViewModel.getMemeListPosition()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCustomCell", for: indexPath) as? MemeDescriptionCollectionViewCell {
            
            let meme = memeViewModel.getMemeListName(position: indexPath.item)
            
            cell.configureCollectionView(memes: meme)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension MemeViewController: UpdateViewMemeDelegate {
    func updateviewMeme() {
        memeCollectionView.reloadData()
    }
    
    
}
