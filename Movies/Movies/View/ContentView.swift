//
//  ContentView.swift
//  Movies
//
//  Created by xdmgzdev on 12/04/2021.
//

import SwiftUI
import Common

struct ContentView: View {
  enum TabItem {
    case movies, more
  }

  @State var selectedItem = TabItem.movies

  var body: some View {
    TabView(selection: $selectedItem) {
      MovieListView()
        .tabItem {
          Image(systemName: "list.dash")
          Text("movies_tabitem_title".localized)
        }
        .tag(TabItem.movies)
      Text("more_tabitem_title".localized)
        .tabItem {
          Image(systemName: "ellipsis.circle")
          Text("more_tabitem_title".localized)
        }
        .tag(TabItem.more)
    }
  }
}

struct RootContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
