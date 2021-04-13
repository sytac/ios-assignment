//
//  MovieCellView.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import SwiftUI

struct MovieCellView: View {
  let movie: Result
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

struct MovieCellView_Previews: PreviewProvider {
  static var previews: some View {
    MovieCellView(movie: Result(title: "Text title", overview: "This an overview of the movie."))
  }
}
