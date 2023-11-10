//
//  MovieInfo.swift
//  Assignment-15
//
//  Created by Eka Kelenjeridze on 03.11.23.
//

import UIKit

enum MovieGenre: String {
    case action = "Action"
    case adventure = "Adventure"
    case horror = "Horror"
    case comedy = "Comedy"
}

struct Movie {
    let image: UIImage?
    let title: String
    let release: String

    let genre: MovieGenre
    var rating: Double
    let certificate: String
    let runtime: String
    let director: String
    let cast: String
    let description: String
    let ratingSource: String
    var addToFavorites: Bool
    
    static let nowOnCinema = [
        Movie(
            image: UIImage(named: "TheBatman"),
            title: "The Batman",
            genre: .action,
            rating: 8.1,
            certificate: "16+",
            runtime: "02:56",
            release: "2022",
            director: "Matt Reeves",
            cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro,     Andy Serkis, Peter Sarsgaard",
            description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
            ratingSource: "IMDB"
        ),
        Movie(
            image: UIImage(named: "Uncharted"),
            title: "Uncharted",
            genre: .adventure,
            rating: 7.9,
            certificate: "16+",
            runtime: "02:56",
            release: "2022",
            director: "Matt Reeves",
            cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro,     Andy Serkis, Peter Sarsgaard",
            description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
            ratingSource: "IMDB"
        ),
        Movie(
            image: UIImage(named: "TheExorcismOfGod"),
            title: "The Exorcism Of God",
            genre: .horror,
            rating: 5.6,
            certificate: "16+",
            runtime: "02:56",
            release: "2022",
            director: "Matt Reeves",
            cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro,     Andy Serkis, Peter Sarsgaard",
            description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
            ratingSource: "IMDB"
            
        ),
        Movie(
            image: UIImage(named: "TurningRed"),
            title: "Turning Red",
            genre: .comedy,
            rating: 7.1,
            certificate: "16+",
            runtime: "02:56",
            release: "2022",
            director: "Matt Reeves",
            cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro,     Andy Serkis, Peter Sarsgaard",
            description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
            ratingSource: "IMDB"
        ),
        Movie(
            image: UIImage(named: "SpiderManNoWayHome"),
            title: "Spider-Man: No Way Home",
            genre: .action,
            rating: 8.1,
            certificate: "16+",
            runtime: "02:56",
            release: "2022",
            director: "Matt Reeves",
            cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro,     Andy Serkis, Peter Sarsgaard",
            description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
            ratingSource: "IMDB"
        ),
        Movie(
            image: UIImage(named: "Morbius"),
            title: "Morbius",
            genre: .action,
            rating: 5.3,
            certificate: "16+",
            runtime: "02:56",
            release: "2022",
            director: "Matt Reeves",
            cast: "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro,     Andy Serkis, Peter Sarsgaard",
            description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.",
            ratingSource: "IMDB"
        )
    ]
    
    
}
