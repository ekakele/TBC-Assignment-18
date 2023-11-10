//
//  MovieData.swift
//  Assignment-15
//
//  Created by Eka Kelenjeridze on 11.11.23.
//

import Foundation

struct MovieSearch: Codable {
    let Search: [MovieItem]
}

struct MovieItem: Codable {
    let Title: String
    let Year: Int
    let imdbID: String
    let Poster: String
}

