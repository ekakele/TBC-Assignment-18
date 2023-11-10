//
//  File.swift
//  Assignment-15
//
//  Created by Eka Kelenjeridze on 11.11.23.
//

import Foundation

protocol MovieManagerDelegate {
    func didLoadMovies(_ movieManager: MovieManager, movie: Movie)
    func didFailWithError(error: Error)
}

struct MovieManager {
    private let moviesURL = "https://www.omdbapi.com/?apikey=b5bf505c&"
    
    private var delegate: MovieManagerDelegate?
    
    private func fetchMovies(titleContains: String) {
        let titleContains = "s=november"
        let urlString = "\(moviesURL)&\(titleContains)"
    }
    
    private func performRequest(urlString: String) {
        if  let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(movieData: safeData)
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(movieData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieSearch.self, from: movieData)
            let title = decodedData.Search[0].Title
            let year = decodedData.Search[0].Year
            let poster = decodedData.Search[0].Poster
            
            let movie = Movie(title: title, image: poster, release: year)
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
