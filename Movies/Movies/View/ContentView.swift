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
    case popular, topRated, more
  }

  @State var selectedItem = TabItem.popular

  var body: some View {
    TabView(selection: $selectedItem) {
      MovieListView()
        .tabItem {
          Image(systemName: "list.dash")
          Text("movies_tabitem_title".localized)
        }
        .tag(TabItem.popular)
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
