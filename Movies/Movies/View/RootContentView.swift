//
//  ContentView.swift
//  Movies
//
//  Created by xdmgzdev on 12/04/2021.
//

import SwiftUI

struct RootContentView: View {
  enum TabItem {
    case movies, more
  }

  @State var selectedItem = TabItem.movies

  var body: some View {
    TabView(selection: $selectedItem) {
      MoviesListView()
        .tabItem {
          Image(systemName: "1.square.fill")
          Text("movies_tabitem_title".localized)
        }
        .tag(TabItem.movies)
      Text("more_tabitem_title".localized)
        .tabItem {
          Image(systemName: "2.square.fill")
          Text("more_tabitem_title".localized)
        }
        .tag(TabItem.more)
    }
  }
}

struct RootContentView_Previews: PreviewProvider {
  static var previews: some View {
    RootContentView()
  }
}
