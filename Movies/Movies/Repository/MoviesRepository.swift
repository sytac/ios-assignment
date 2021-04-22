//
//  MoviesRepository.swift
//  Movies
//
//  Created by xdmgzdev on 14/04/2021.
//

import Combine
import Foundation
import NetworkProvider

class MoviesRepository: MoviesRepositoryProtocol {
  var client: NetworkProviderProtocol?
  @Published var movieList = MovieList()
  @Published var error: Swift.Error?

  func getPopular() {
//    movieList = Bundle.main.decode(MovieList.self, from: "sample_movie_list_big.json")
    client = MovieServiceClient(clientService: PopularMoviesService())
    client!.request(dataType: MovieList.self, onQueue: .main) { result in
      do {
        self.movieList = try result.get()
      } catch {
        self.error = error
      }
    }
  }

  func getTopRated() {
    client = MovieServiceClient(clientService: TopRatedMoviesService())
    client!.request(dataType: MovieList.self, onQueue: .main) { result in
      do {
        self.movieList = try result.get()
      } catch {
        self.error = error
      }
    }
  }
}
