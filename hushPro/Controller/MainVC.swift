//
//  MainVC.swift
//  hushPro
//
//  Created by harikrishnan on 23/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
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
    }
}


extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell") as? MoviewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "moviesCell")
        }
        
        let movie = mainViewModel.getCellItem(indexPath: indexPath)
        
        cell.movieName.text = movie.title
        
        return cell
    }
}
