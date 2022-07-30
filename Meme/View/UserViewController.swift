//
//  UserViewController.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 26/07/22.
//

import UIKit
import Kingfisher

class UserViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    let userViewModel: UserViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel.logoutDelegate = self
        configureUser()
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        userViewModel.logout()
    }
    
    func configureUser() {
        nameLabel.text = userViewModel.getName
        emailLabel.text = userViewModel.getEmail
        photoImageView.kf.setImage(with: userViewModel.getImage)
    }
    
}

extension UserViewController: LogoutDelegate {
    func logoutSuccess() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginMemeViewController")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(view: loginViewController)
    }
}
