//
//  MovieListViewModel.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Common
import Foundation

class MovieListViewModel: MovieListViewModelProtocol {
  @Published var title = "Movies".localized
  @Published var datasource: [Movie] = []
  @Published var showError = false
  var errorMessage: String? = nil
  private var timer: Timer = Timer()

  func loadData() {
    datasource = Bundle.main.decode(MovieList.self, from: "sample_movie_list.json").results
    title = "\("Movies".localized) (\(datasource.count))"
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
      self.errorMessage = "alert_error_message".localized
      self.showError.toggle()
    })
  }

  func handleSelectedCell(indexPath: IndexPath) -> Bool {
    return true
  }
}
