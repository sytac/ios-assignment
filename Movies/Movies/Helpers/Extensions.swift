//
//  Extensions.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Foundation

extension Bundle {
  func decode<T: Decodable>(_: T.Type, from file: String) -> T {
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to lacate \(file) in bundle.")
    }

    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }

    guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle.")
    }

    return loaded
  }
}

extension String {
  /// Fetches a localised String Arguments
  var localized: String {
    NSLocalizedString(self, comment: "")
  }

  /// Fetches a localised String Arguments
  ///
  /// - Parameter arguments: parameters to be added in a string
  /// - Returns: localized string
  func localized(with arguments: [CVarArg]) -> String {
    String(format: localized, locale: Locale.current, arguments: arguments)
  }
}
