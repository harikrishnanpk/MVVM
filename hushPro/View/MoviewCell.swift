//
//  MoviewCell.swift
//  hushPro
//
//  Created by harikrishnan on 02/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import UIKit

class MoviewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie: Movie!{
        didSet{
            movieName.text = movie.title
            //            movieImage.sd_setImage(with: movieViewModel.imageUrl) { (image, error, cacheType, url) in
            //
            //            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
