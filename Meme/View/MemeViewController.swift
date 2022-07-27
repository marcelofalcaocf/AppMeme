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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUser()
    }
    
    func configureUser() {
        posterUserImageView.kf.setImage(with: memeViewModel.getUserImage)
        greetings.text = memeViewModel.getUserName
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
