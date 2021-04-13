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
  let belongsToCollection: JSONNull?
  let budget: Int
  let genres: [Genre]
  let homepage: String
  let id: Int
  let imdbID: String
  let originalLanguage: String
  let originalTitle: String
  let overview: String
  let popularity: Double
  let posterPath: JSONNull?
  let productionCompanies: [ProductionCompany]
  let productionCountries: [ProductionCountry]
  let releaseDate: String
  let revenue: Int
  let runtime: Int
  let spokenLanguages: [SpokenLanguage]
  let status: String
  let tagline: String
  let title: String
  let video: Bool
  let voteAverage: Double
  let voteCount: Int

  enum CodingKeys: String, CodingKey {
    case adult = "adult"
    case backdropPath = "backdrop_path"
    case belongsToCollection = "belongs_to_collection"
    case budget = "budget"
    case genres = "genres"
    case homepage = "homepage"
    case id = "id"
    case imdbID = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview = "overview"
    case popularity = "popularity"
    case posterPath = "poster_path"
    case productionCompanies = "production_companies"
    case productionCountries = "production_countries"
    case releaseDate = "release_date"
    case revenue = "revenue"
    case runtime = "runtime"
    case spokenLanguages = "spoken_languages"
    case status = "status"
    case tagline = "tagline"
    case title = "title"
    case video = "video"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
}

// MARK: - Genre
struct Genre: Codable {
  let id: Int
  let name: String

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
  }
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
  let id: Int
  let logoPath: String?
  let name: String
  let originCountry: String

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case logoPath = "logo_path"
    case name = "name"
    case originCountry = "origin_country"
  }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
  let iso3166_1: String
  let name: String

  enum CodingKeys: String, CodingKey {
    case iso3166_1 = "iso_3166_1"
    case name = "name"
  }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
  let iso639_1: String
  let name: String

  enum CodingKeys: String, CodingKey {
    case iso639_1 = "iso_639_1"
    case name = "name"
  }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
    return true
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine("")
  }

  public init() {}

  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}
