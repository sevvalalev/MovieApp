//
//  ViewController.swift
//  MovieApp
//
//  Created by Sevval Alev on 28.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var movieManager = MovieManager()
    var movies: MovieData? {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()
        fetchData()
    }
    
    private func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchData() {
        movieManager.delegate = self
        movieManager.movieJson()
    }
}

//MARK: - MovieDataTransferDelegate
extension ViewController: MovieDataTransferDelegate {
    func sendMovieData(movie: MovieData) {
        movies = movie
    }
}

//MARK: - TableView Delegate && DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieCell {
            cell.configure(with: movies?.results[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "toDetailsVC") as? DetailsVC {
            let selectedMovie = movies?.results[indexPath.row]
            vc.movie = selectedMovie
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
    

