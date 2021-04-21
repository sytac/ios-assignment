//
//  PopularMovieListViewModel.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Common
import Foundation

class PopularMovieListViewModel: ListViewModelProtocol {
  @Published private(set) var title = "movies_navbar_title".localized
  @Published private(set) var datasource: [PopularMovie] = []
  @Published var showError = false
  var errorMessage: String? = nil
  private var repository: MoviesRepositoryProtocol

  init(repository: MoviesRepositoryProtocol = MoviesRepository()) {
    self.repository = repository
  }

  func loadData() {
    repository.getPopular { [weak self] result in
      guard let self = self else { return }

      switch result {
      case let .success(list):
        self.handleSuccess(data: list)
      case let .failure(error):
        self.handleFailure(error: error)
      }
    }
  }
}

private extension PopularMovieListViewModel {
  func handleSuccess(data: MovieList) {
    datasource = MovieAdaptor.popular(data.results)
    title = "\("movie_popular_title".localized) (\(datasource.count))"
  }

  func handleFailure(error: Error) {
    errorMessage = "\(error)"
    showError = true
  }
}
