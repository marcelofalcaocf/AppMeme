//
//  MemeModel.swift
//  Meme
//
//  Created by Marcelo Falcao Costa Filho on 29/07/22.
//

import Foundation

struct Meme: Decodable {
    let success: Bool
    let data: dataMeme
}


//"success": true,
//    "data": {
//        "memes": [
//            {
//                "id": "61579",
//                "name": "One Does Not Simply",
//                "url": "https://i.imgflip.com/1bij.jpg",
//                "width": 568,
//                "height": 335,
//                "box_count": 2
//            },
