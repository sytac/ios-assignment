//
//  MoviesRepository.swift
//  Movies
//
//  Created by xdmgzdev on 14/04/2021.
//

import Common
import UIKit
import Foundation
import NetworkProvider

class MoviesRepository: MoviesRepositoryProtocol {
  var client: NetworkProviderProtocol?

  func getPopular(completion: @escaping (Result<MovieList, Swift.Error>) -> Void) {
//    client = MovieServiceClient(clientService: PopularMoviesService())
//    client!.request(dataType: MovieList.self, onQueue: .main, completion: completion)
    let result = Bundle.main.decode(MovieList.self, from: "sample_movie_list_big.json")
    completion(.success(result))
  }

  func getTopRated(completion: @escaping (Result<MovieList, Swift.Error>) -> Void) {
    client = MovieServiceClient(clientService: TopRatedMoviesService())
    client!.request(dataType: MovieList.self, onQueue: .main, completion: completion)
  }
}
