//
//  Environment.swift
//  NetworkProvider
//
//  Created by xdmgzdev on 14/04/2021.
//

import Foundation

public enum Environment {
  static let successStatusCodeRange: Range<Int> = 200 ..< 300
  static let requestDefaultTimeout: TimeInterval = 60
}

public enum HttpHeaderKey {
  static let contentType = "Content-Type"
  static let acceptLanguage = "Accept-Language"
  static let contentLength = "Content-Length"
  static let contentDisposition = "Content-Disposition"
  static let accept = "Accept"
  static let authorization = "Authorization"
}

public enum HttpMethod: String {
  case get = "GET"
  case post = "POST"
  case patch = "PATCH"
  case delete = "DELETE"
  case connect = "CONNECT"
  case head = "HEAD"
  case options = "OPTIONS"
  case put = "PUT"
  case trace = "TRACE"
}

public enum MimeType: String {
  case json = "application/json"
  case plain = "text/plain"
  case javascript = "text/javascript"
  case gif = "image/gif"
  case png = "image/png"
  case jpg = "image/jpg"
  case jpeg = "image/jpeg"
  case svg = "image/svg"
  case multipart = "multipart/form-data"
  case urlEncoded = "application/x-www-form-urlencoded"
}
