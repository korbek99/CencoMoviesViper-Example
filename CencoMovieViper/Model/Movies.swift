//
//  Movies.swift
//  CencoMovieViper
//
//  Created by Jose David Bustos H on 09-03-23.
//

import Foundation
struct Movies: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
