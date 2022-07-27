//
//  UserViewController.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 26/07/22.
//

import UIKit

class UserViewController: UIViewController {

    let userViewModel: UserViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel.logoutDelegate = self
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        userViewModel.logout()
    }
    
}

extension UserViewController: LogoutDelegate {
    func logoutSuccess() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginMemeViewController")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(view: loginViewController)
    }
}
