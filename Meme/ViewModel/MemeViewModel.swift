//
//  MemeViewModel.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 27/07/22.
//

import Foundation
import FirebaseAuth
import FirebaseCore

class MemeViewModel {
    
    let user = Auth.auth().currentUser
        
    var getUserImage: URL? {
        guard let image = user?.photoURL else { return nil }
        return image
    }
    
    var getUserName: String? {
        guard let name = user?.displayName else {return nil}
        return "Boas vindas, \(name)!"
    }
}
