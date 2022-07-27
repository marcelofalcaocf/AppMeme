//
//  ViewController.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 26/07/22.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    private let loginViewModel: LoginViewModel = .init()
    
    @IBOutlet weak var loginGoogleStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.delegate = self
        configureGesture()
    }
    
    private func configureGesture() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(tapAction(_:)))
        
        self.loginGoogleStackView.addGestureRecognizer(tap)
    }
    
    @objc private func tapAction(_ sender: UITapGestureRecognizer) {
        loginViewModel.makeLoginWithGoogle()
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    func loginWithGoogle(_ configuration: GIDConfiguration) {
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: self) { [unowned self] user, error in
            self.loginViewModel.handleGoogleSigIn(user: user, error: error)
        }
    }
    
    func loginSuccess() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "DescriptionMemeAndLogin")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(view: tabBarController)
    }
    
    func loginError() {
        let alert = UIAlertController(
            title: "Aviso",
            message: "Login não pode ser efetuado, tente novamente mais tarde!",
            preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
}
