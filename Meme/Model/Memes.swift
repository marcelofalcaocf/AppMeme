//
//  MemeModel.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 29/07/22.
//

import Foundation

struct Memes: Decodable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int
}

//               "id": "61579",
//                "name": "One Does Not Simply",
//                "url": "https://i.imgflip.com/1bij.jpg",
//                "width": 568,
//                "height": 335,
//                "box_count": 2
