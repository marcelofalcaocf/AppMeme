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
    
    private let memeService: ApiMemeService = .init()
    private let user = Auth.auth().currentUser
    private var memeList: [Meme] = []
    
    var getUserImage: URL? {
        guard let image = user?.photoURL else { return nil }
        return image
    }
    
    var getUserName: String? {
        guard let name = user?.displayName else {return nil}
        return "Boas vindas, \(name)!"
    }
    
    func getMemeService() {
        memeService.getMeme { meme in
            self.memeList = meme
        }
    }
    
    func getMemeListPosition() -> Int {
        memeList.count
    }
    
    func getMemeListName(position: Int) -> Meme {
        let meme = memeList[position]
        
        return meme
    }
    
    func handlerUser(completion: @escaping (User?) -> Void) {
        guard let user = user else { return }
        
        completion(user)
    }
}

