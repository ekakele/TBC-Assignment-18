//
//  File.swift
//  Assignment-18: Assignment-15 + API
//
//  Created by Eka Kelenjeridze on 11.11.23.
//

import Foundation

struct APIService {
    static func fetchMovies(completion: @escaping([Movie]?) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=b5bf505c&s=november") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let searchedMovies = try JSONDecoder().decode(SearchedMovies.self, from: data)
                
                DispatchQueue.main.async {
                    completion(searchedMovies.Search)
                }
            } catch {
                completion(nil)
                print("Failed decoding data: \(error)")
            }
        }.resume()
    }
}
