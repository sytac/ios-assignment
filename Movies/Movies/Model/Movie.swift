//
//  Movie.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Foundation

struct Movie: Codable, Identifiable {
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

  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case genreIDS = "genre_ids"
    case id
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview
    case popularity
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case title
    case video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }

  init(title: String, overview: String) {
    self.title = title
    self.overview = overview
    adult = false
    backdropPath = ""
    genreIDS = []
    id = 000
    originalLanguage = ""
    originalTitle = ""
    popularity = 0.0
    posterPath = ""
    releaseDate = ""
    video = false
    voteAverage = 0.0
    voteCount = 0
  }

  #if DEBUG
  static var preview: Movie {
    Movie(
      title: "Best movie ever",
      overview: """
      This an overview of the movie, with a long enough description.
      This will allow to check long text descriptions. Sed ut perspiciatis,
      unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,
      totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae
      vitae dicta sunt, explicabo.
      """
    )
  }
  #endif
}
