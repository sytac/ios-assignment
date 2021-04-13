//
//  MoviesListView.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import SwiftUI

struct MoviesListView: View {
  let movies = Bundle.main.decode(MovieList.self, from: "sample_movie_list.json").results

  var body: some View {
    NavigationView {
      List {
        ForEach(movies) { movie in
          MovieCellView(movie: movie)
        }
      }
      .navigationTitle("movies_list_title".localized)
    }
  }
}

struct MoviesListView_Previews: PreviewProvider {
  static var previews: some View {
    MoviesListView()
  }
}
