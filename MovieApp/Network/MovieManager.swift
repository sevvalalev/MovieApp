//
//  MovieManager.swift
//  MovieApp
//
//  Created by Sevval Alev on 10.10.2022.
//

import Foundation

protocol MovieDataTransferDelegate: AnyObject {
    func sendMovieData(movie: MovieData)
}

//MARK: - Fetch Data
class MovieManager {
    
    weak var delegate: MovieDataTransferDelegate?
    
    func movieJson() {
        let url = URL(string: C.URL.movieUrl)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                //decoding json data
                do{
                    let movies = try JSONDecoder().decode(MovieData.self, from: data!)
                    
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.delegate?.sendMovieData(movie: movies)
                    }
                } catch {
                    print("Error fetching data!\(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

