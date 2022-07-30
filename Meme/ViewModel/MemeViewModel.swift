//
//  MemeViewModel.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 27/07/22.
//

import Foundation
import FirebaseAuth
import FirebaseCore

protocol UpdateViewMemeDelegate {
    func updateviewMeme()
}

class MemeViewModel {
    
    private let memeService: ApiMemeService = .init()
    private var memeList: [Memes] = []
    var delegate: UpdateViewMemeDelegate?
    
    private var user: User? {
        Auth.auth().currentUser
    }
    
    var getUserImage: URL? {
        guard let image = user?.photoURL else { return nil }
        return image
    }
    
    var getUserName: String? {
        guard let name = user?.displayName else {return nil}
        return "Boas vindas, \(name)!"
    }

    func getMemes() {
        memeService.getMemes { meme in
            self.memeList = meme
            self.delegate?.updateviewMeme()
        }
    }
    
    func getMemeListPosition() -> Int {
        memeList.count
    }
    
    func getMemeListName(position: Int) -> Memes {
        let meme = memeList[position]
        
        return meme
    }
}

