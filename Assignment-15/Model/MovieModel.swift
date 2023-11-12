//
//  MovieData.swift
//  Assignment-18: Assignment-15 + API
//
//  Created by Eka Kelenjeridze on 11.11.23.
//

import Foundation

struct SearchedMovies: Codable {
    let Search: [Movie]
}

struct Movie: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey  {
        case imdbID
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case poster = "Poster"
    }
}
