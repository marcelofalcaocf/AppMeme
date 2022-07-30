//
//  UserViewModel.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 27/07/22.
//

import Foundation
import FirebaseAuth
import FirebaseCore

protocol LogoutDelegate {
    func logoutSuccess()
}

class UserViewModel {
    
    var logoutDelegate: LogoutDelegate?
    
    private var user: User? {
        Auth.auth().currentUser
    }
    
    var getImage: URL? {
        guard let image = user?.photoURL else { return nil }
        return image
    }
    
    var getName: String? {
        guard let name = user?.displayName else { return nil }
        return "Boas vindas, \(name)!"
    }
    
    var getEmail: String? {
        guard let email = user?.email else { return nil }
        return email
    }
    
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
