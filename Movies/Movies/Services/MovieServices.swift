//
//  MovieService.swift
//  Movies
//
//  Created by xdmgzdev on 14/04/2021.
//

import Foundation
import NetworkProvider
import PlistReader

enum CommonMovieService {
  static let supportedLanguages = Set(["en", "es", "nl"])

  static var baseURL: String {
    let apiBaseURL: String = try! PlistReader.value(for: "API_BASE_URL")
    let apiVersion: String = try! PlistReader.value(for: "API_VERSION")
    return "https://\(apiBaseURL)/\(apiVersion)"
  }

  static var apiKey: String {
    try! PlistReader.value(for: "API_KEY")
  }

  static var language: String {
    guard let current = Locale.current.languageCode,
          CommonMovieService.supportedLanguages.contains(current) else {
      return "en"
    }

    return current
  }

  static var queryItems: [URLQueryItem] {
    let apiKeyItem = URLQueryItem(name: "api_key", value: CommonMovieService.apiKey)
    let language = URLQueryItem(name: "language", value: CommonMovieService.language)
    return [apiKeyItem, language]
  }
}

struct PopularMoviesService: NetworkService {
  var baseURL: String {
    CommonMovieService.baseURL
  }

  var method: HttpMethod {
    .get
  }

  var httpBody: Encodable? {
    nil
  }

  var headers: [String: String]? {
    [HttpHeaderKey.accept: MimeType.json.rawValue]
  }

  var queryParameters: [URLQueryItem]? {
    CommonMovieService.queryItems
  }

  var timeout: TimeInterval? {
    30
  }

  var path: String {
    "/movie/popular"
  }
}

struct TopRatedMoviesService: NetworkService {
  var baseURL: String {
    CommonMovieService.baseURL
  }

  var method: HttpMethod {
    .get
  }

  var httpBody: Encodable? {
    nil
  }

  var headers: [String: String]? {
    [HttpHeaderKey.accept: MimeType.json.rawValue]
  }

  var queryParameters: [URLQueryItem]? {
    CommonMovieService.queryItems
  }

  var timeout: TimeInterval? {
    30
  }

  var path: String {
    "/movie/top_rated"
  }
}
