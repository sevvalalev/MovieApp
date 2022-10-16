//
//  MovieCell.swift
//  MovieApp
//
//  Created by Sevval Alev on 5.10.2022.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var posterPathImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        prepareUI()
    }

    private func prepareUI() {
        overviewLabel.font = overviewLabel.font.withSize(14)
        voteLabel.font = voteLabel.font.withSize(13)
        voteLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    func configure(with model: Result?) {
        guard let model = model else {
            return
        }
        
        titleLabel.text = model.original_title
        releaseDateLabel.text = model.release_date
        overviewLabel.text = model.overview
        voteLabel.text = model.voteString
        
        posterPathImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        posterPathImageView.sd_setImage(with: URL(string: C.URL.imageUrl.appending(model.poster_path)), placeholderImage: UIImage(named: "noImageAvailable"))
    }
}


