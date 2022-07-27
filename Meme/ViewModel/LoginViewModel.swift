//
//  LoginViewModel.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 26/07/22.
//

import Foundation
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

protocol LoginViewModelDelegate {
    func loginWithGoogle(_ configuration: GIDConfiguration)
    func loginSuccess()
    func loginError()
}

class LoginViewModel {
    
    let loginService: LoginService = .init()
    var delegate: LoginViewModelDelegate?
    
    func makeLoginWithGoogle() {
        guard let config = loginService.getConfigureWithGoogle() else { return }
        
        delegate?.loginWithGoogle(config)
    }
    
    func handleGoogleSigIn(user: GIDGoogleUser?, error: Error?) { // tratar
        if error != nil {
            print(error)
            delegate?.loginError()
            return
        }
        guard
           let authentication = user?.authentication,
           let idToken = authentication.idToken
         else {
           return
         }

         let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                        accessToken: authentication.accessToken)

        loginService.toSaveOnFireBase(credential: credential)
        
        delegate?.loginSuccess()
    }
    
}
