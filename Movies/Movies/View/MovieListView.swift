//
//  MovieListView.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Combine
import Common
import SwiftUI

struct MovieListView: View {
  @ObservedObject var viewModel: MovieListViewModel
  init(viewModel: MovieListViewModel = MovieListViewModel()) {
    self.viewModel = viewModel
  }

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.datasource) { movie in
          NavigationLink(destination: Text("To be implemented")) {
            MovieRow(movie: movie)
          }
        }
      }
      .navigationTitle(viewModel.title)
    }
    .onAppear {
      viewModel.loadData()
    }.alert(isPresented: $viewModel.showError, content: {
      Alert(title: Text("alert_error_title".localized), message: Text(viewModel.errorMessage ?? ""))
    })
  }
}

struct MovieListView_Previews: PreviewProvider {
  static var previews: some View {
    MovieListView()
  }
}
