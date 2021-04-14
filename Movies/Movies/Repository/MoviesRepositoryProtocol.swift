//
//  MoviesRepositoryProtocol.swift
//  Movies
//
//  Created by xdmgzdev on 14/04/2021.
//

import Foundation

protocol MoviesRepositoryProtocol {
  func getPopular(completion: @escaping (Result<MovieList, Swift.Error>) -> Void)
  func getTopRated(completion: @escaping (Result<MovieList, Swift.Error>) -> Void)
}
