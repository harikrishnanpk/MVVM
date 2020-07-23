//
//  MainViewModel.swift
//  hushPro
//
//  Created by harikrishnan on 03/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation
import UIKit

class MainViewModel: NSObject {
    
    var moviesViewModel: ObjectBinder<[MovieViewModel]> = ObjectBinder(value: [])
    
    var pageNumber: Int = 1
    var isMoviesLoading: ObjectBinder<BoolEnum> = ObjectBinder(value: .off)
    
    weak var serviceProvider:ServiceProvider<MovieService>?
    
    init(service: ServiceProvider<MovieService>) {
        self.serviceProvider = service
    }
}

extension MainViewModel {
    func loadMovies() {
        isMoviesLoading.value.switchType()
        serviceProvider?.load(service: .popular(page: pageNumber), decodeType: MoviesList.self, completion: { [weak self] result in
            self?.isMoviesLoading.value.switchType()
            switch result{
            case .success(let list):
                
                let popularMovies = PopularMovieViewModelItem(movies: list.results);
                self?.moviesViewModel.value.append(popularMovies)
            
            case .failure(let error):
                print(error.localizedDescription)
            case .empty:
                print("Empty Data")
            }
        })
    }
}

extension MainViewModel: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return moviesViewModel.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.value[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movieViewModel = moviesViewModel.value[indexPath.section]
        
        switch movieViewModel.type {
            
        case .PopularMovies:
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as MoviewCell
            
            if let popularMovies = movieViewModel as? PopularMovieViewModelItem{
                cell.movie = popularMovies.movies[indexPath.row]
            }
            
            return cell
            
        case .TrendingMovies:
            return UITableViewCell()
        }
    }
}
