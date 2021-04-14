//
//  MovieListViewModel.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Common
import Foundation

class MovieListViewModel: MovieListViewModelProtocol {
  @Published var title = "movies_tabitem_title".localized
  @Published var datasource: [Movie] = []
  @Published var showError = false
  var errorMessage: String? = nil
  private var repository: MoviesRepositoryProtocol

  init(repository: MoviesRepositoryProtocol = MoviesRepository()) {
    self.repository = repository
  }

  func loadData() {
    repository.getPopular(completion: { [weak self] result in
      guard let self = self else { return }

      switch result {
      case let .success(list):
        self.handleSuccess(data: list)
      case let .failure(error):
        self.handleFailure(error: error)
      }
    })
  }

  func handleSelectedCell(indexPath: IndexPath) -> Bool {
    return true
  }
}

private extension MovieListViewModel {
  func handleSuccess(data: MovieList) {
    datasource = data.results
    title = "\("movie_popular_title".localized) (\(datasource.count))"
  }

  func handleFailure(error: Error) {
    errorMessage = "\(error)"
    showError = true
  }
}
