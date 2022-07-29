//
//  ApiMemeService.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 29/07/22.
//

import Foundation
import Alamofire

class ApiMemeService {
    
    func getMeme(completion: @escaping ([Meme]) -> Void) {
        AF.request("https://imgflip.com/api").responseDecodable(of: Meme.self) {
            response in
            
            let resultOfRequisiton = response.result
            
            switch resultOfRequisiton {
                
            case .success(let meme):
                completion([meme])
            case .failure(_):
                break
            }
        }
    }
}
