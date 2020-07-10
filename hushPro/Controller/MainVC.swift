//
//  MainVC.swift
//  hushPro
//
//  Created by harikrishnan on 23/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import UIKit
import SDWebImage


class MainVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let provider = ServiceProvider<MovieService>()
    private lazy var mainViewModel:MainViewModel = {
        return MainViewModel(service: provider)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       initViewModel()
    }
    
    func initViewModel(){
        mainViewModel.loadMovies()
        
        mainViewModel.movies.bind { [weak self] movie in
            self?.tableview.reloadData()
        }
        
        mainViewModel.isMoviesLoading.bind { [weak self] status in
            if status == false{
                self?.tableview.isHidden = false
                self?.activityIndicator.stopAnimating()
            }else{
                self?.tableview.isHidden = true
                self?.activityIndicator.startAnimating()
            }
        }
    }
}


extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as MoviewCell
        
        let movieViewModel = mainViewModel.getCellItem(indexPath: indexPath)
        
        cell.movieViewModel = movieViewModel
        
        return cell
    }
}
