//
//  MemeDescriptionCollectionViewCell.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 26/07/22.
//

import UIKit
import Kingfisher

class MemeDescriptionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var nameMemeLabel: UILabel!
    
    func configureCollectionView(meme: Meme) {
        memeImageView.kf.setImage(with: meme.data.memes.url)
        nameMemeLabel.text = meme.data.memes.name
    }
}
