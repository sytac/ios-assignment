//
//  NetworkService.swift
//  NetworkProvider
//
//  Created by xdmgzdev on 14/04/2021.
//

import Foundation

public protocol NetworkService {
  var baseURL: String { get }
  var path: String { get }
  var method: HttpMethod { get }
  var httpBody: Encodable? { get }
  var headers: [String: String]? { get }
  var queryParameters: [URLQueryItem]? { get }
  var timeout: TimeInterval? { get }
}

public extension NetworkService {
  var urlRequest: URLRequest {
    guard let url = self.url else {
      fatalError("URL could not be built")
    }

    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.allHTTPHeaderFields = headers
    request.timeoutInterval = timeout ?? Environment.requestDefaultTimeout

    if let httpBody = httpBody {
      request.httpBody = try? httpBody.jsonEncode()
    }

    return request
  }
}

private extension NetworkService {
  var url: URL? {
    var urlComponents = URLComponents(string: baseURL)
    urlComponents?.path = path

    guard let queryParams = queryParameters else {
      return urlComponents?.url
    }

    urlComponents?.queryItems?.append(contentsOf: queryParams)

    return urlComponents?.url
  }
}

private extension Encodable {
  func jsonEncode() throws -> Data? {
    try JSONEncoder().encode(self)
  }
}