//
//  MoviesService.swift
//  hushPro
//
//  Created by harikrishnan on 01/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

enum MovieService {
    case popular(page:Int)
    case newMovies(page:Int)
}

extension MovieService: Service {
    
    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/3/movie/popular"
        case .newMovies:
            return "/3/movie/now_playing"
        }
    }
    
    var parameters: [String : Any]? {
        var params: [String: Any] = ["api_key": "c3b5ab805a4d255267b1a9e2ab66a63d"]
        
        switch self {
        case .popular(let page):
            params["page"] = "\(page)"
        case .newMovies(let page):
            params["page"] = "\(page)"
            break
        }
        
        return params
    }
    
    var method: ServiceMethod {
        .get
    }
}
