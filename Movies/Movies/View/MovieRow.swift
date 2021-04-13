//
//  MovieRow.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import SwiftUI

struct MovieRow: View {
  let movie: Movie
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("\(movie.title)")
      Text("\(movie.overview)")
        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        .font(.footnote)
        .foregroundColor(.secondary)
    }
    .padding(.top, 5)
  }
}

struct MovieRow_Previews: PreviewProvider {
  static var previews: some View {
    MovieRow(movie: Movie(title: "Text title", overview: "This an overview of the movie."))
  }
}
