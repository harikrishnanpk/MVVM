//
//  MovieViewModel.swift
//  hushPro
//
//  Created by harikrishnan on 10/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

enum MainViewCellTypes {
    case PopularMovies
    case TrendingMovies
}

protocol MovieViewModel {
    var type: MainViewCellTypes { get }
    var numberOfRows: Int { get }
    var sectionTitle: String { get }
}

extension MovieViewModel{
    var numberOfRows: Int {
        return 1
    }
}

class PopularMovieViewModelItem: MovieViewModel {
    var type: MainViewCellTypes {
        .PopularMovies
    }
    
    var sectionTitle: String {
        return "Popular Movies"
    }
    
    var numberOfRows: Int {
        return movies.count
    }
    
    var movies = [Movie]()
    
    init(movies: [Movie]) {
        self.movies = movies
    }
}

class TreandingMovieViewModelItem: MovieViewModel {
    var type: MainViewCellTypes {
        .TrendingMovies
    }
    
    var sectionTitle: String {
        return "Treanding Movies"
    }
    
    var numberOfRows: Int {
        return movies.count
    }
    
    var movies = [Movie]()
    
    init(movies: [Movie]) {
        self.movies = movies
    }
}
