//
//  MainVC.swift
//  hushPro
//
//  Created by harikrishnan on 23/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    let provider = ServiceProvider<MovieService>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        provider.load(service: .popular(page: 1), decodeType: MoviesList.self) { result in
            switch result {
            case .success(let list):
                print(list.page)
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .empty:
                print("No data")
            }
        }
    }
}

