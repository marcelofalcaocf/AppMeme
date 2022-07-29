//
//  MemeViewController.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 26/07/22.
//

import UIKit
import Kingfisher

class MemeViewController: UIViewController {
    
    var memeViewModel: MemeViewModel = .init()
    
    @IBOutlet weak var posterUserImageView: UIImageView!
    @IBOutlet weak var greetings: UILabel!
    @IBOutlet weak var memeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUser()
        
        memeCollectionView.dataSource = self
    }
    
    func configureUser() {
        DispatchQueue.main.async {
            self.posterUserImageView.kf.setImage(with: self.memeViewModel.getUserImage)
            self.greetings.text = self.memeViewModel.getUserName
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension MemeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memeViewModel.getMemeListPosition()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeDescriptionCollectionViewCell", for: indexPath) as? MemeDescriptionCollectionViewCell {
            
            let meme = memeViewModel.getMemeListName(position: indexPath.item)
            
            cell.configureCollectionView(meme: meme)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
}
