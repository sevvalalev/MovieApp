//
//  DetailsVC.swift
//  MovieApp
//
//  Created by Sevval Alev on 5.10.2022.
//

import UIKit
import SDWebImage

class DetailsVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var posterPathImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    var movie: Result?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController()
        prepareUI()
    }
    
    //MARK: - Navigation Controller
    
    func navigationController(){
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    //MARK: - PrepareUI
    private func prepareUI() {
        guard let movie = movie else {
            return
        }
        
        titleLabel.text = movie.original_title
        releaseDateLabel.text = movie.release_date
        voteLabel.text = movie.voteString
        overviewLabel.text = movie.overview
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.lineBreakMode = .byTruncatingTail
        
        posterPathImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        print((movie.poster_path))
        posterPathImageView.sd_setImage(with: URL(string: C.URL.imageUrl.appending(movie.poster_path)), placeholderImage: UIImage(named: "noImageAvailable"))
    }
}
