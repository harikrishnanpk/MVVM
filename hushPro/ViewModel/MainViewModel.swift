//
//  MainViewModel.swift
//  hushPro
//
//  Created by harikrishnan on 03/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

class MainViewModel {
    
    var movies: ObjectBinder<[Movie]> = ObjectBinder(value: [])
    
    var pageNumber: Int = 1
    
    weak var serviceProvider:ServiceProvider<MovieService>?
    
    init(service: ServiceProvider<MovieService>) {
        self.serviceProvider = service
    }
}

extension MainViewModel {
    func loadMovies() {
        serviceProvider?.load(service: .popular(page: pageNumber), decodeType: MoviesList.self, completion: { [weak self] result in
            switch result{
            case .success(let list):
                self?.movies.value = list.results
            case .failure(let error):
                print(error.localizedDescription)
            case .empty:
                print("Empty Data")
            }
        })
    }
}

extension MainViewModel{
    func numberOfMovies() -> Int {
        return movies.value.count
    }
    
    func getCellItem(indexPath: IndexPath) -> Movie {
        return movies.value[indexPath.row]
    }
}
