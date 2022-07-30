//
//  ApiMemeService.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 29/07/22.
//

import Foundation
import Alamofire

class ApiMemeService {
    
    func getMemes(completion: @escaping ([Memes]) -> Void) {
        AF.request("https://api.imgflip.com/get_memes").responseDecodable(of: Meme.self) {
            response in
            
            let resultOfRequisiton = response.result
            
            switch resultOfRequisiton {
                
            case .success(let meme):
                completion(meme.data.memes)
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }
}
