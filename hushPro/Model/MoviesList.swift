//
//  MoviesList.swift
//  hushPro
//
//  Created by harikrishnan on 01/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

struct MoviesList: Codable {
    
    var page:Int
    var totalPages:Int
    var totalResults:Int
    var results: [Movie]
    
    enum CodingKeys: String, CodingKey {
         case page
         case totalPages = "total_pages"
         case totalResults = "total_results"
         case results
     }
}
