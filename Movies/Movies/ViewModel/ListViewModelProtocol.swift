//
//  ListViewModelProtocol.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Foundation

protocol ListViewModelProtocol: ObservableObject {
  var title: String { get }
  var datasource: [Movie] { get }
  var showError: Bool { get }
  var errorMessage: String? { get }
  func loadData()
  func handleSelectedCell(indexPath: IndexPath) -> Bool
}
