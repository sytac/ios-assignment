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
  static var baseURL: String {
    let apiBaseURL: String = try! PlistReader.value(for: "API_BASE_URL")
    let apiVersion: String = try! PlistReader.value(for: "API_VERSION")
    return "https://\(apiBaseURL)/\(apiVersion)"
  }

  static var apiKey: String {
    try! PlistReader.value(for: "API_KEY")
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
    return [URLQueryItem(name: "api_key", value: CommonMovieService.apiKey)]
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
    return [URLQueryItem(name: "api_key", value: CommonMovieService.apiKey)]
  }

  var timeout: TimeInterval? {
    30
  }

  var path: String {
    "/movie/top_rated"
  }
}
