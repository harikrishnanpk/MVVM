//
//  MovieViewModel.swift
//  hushPro
//
//  Created by harikrishnan on 10/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation


class MovieViewModel {
    
    private var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var name:String{
        return movie.title
    }
    
    var imageUrl: URL? {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w440_and_h660_face/\(movie.posterPath)")  else {
            return nil
        }
        return url
    }
}
