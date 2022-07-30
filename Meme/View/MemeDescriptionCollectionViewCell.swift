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
    
    func configureCollectionView(memes: Memes) {
        guard let url = URL(string: memes.url) else { return }
        memeImageView.kf.setImage(with: url)
        nameMemeLabel.text = memes.name
    }
}
