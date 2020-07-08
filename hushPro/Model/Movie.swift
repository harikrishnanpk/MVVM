//
//  Movie.swift
//  hushPro
//
//  Created by harikrishnan on 01/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var title: String
    var posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
    }
}
