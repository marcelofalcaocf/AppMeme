//
//  UserViewModel.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 27/07/22.
//

import Foundation
import FirebaseAuth

protocol LogoutDelegate {
    func logoutSuccess()
}

class UserViewModel {
    
    var logoutDelegate: LogoutDelegate?
    
    func logout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            logoutDelegate?.logoutSuccess()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
