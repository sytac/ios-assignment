//
//  Error.swift
//  NetworkProvider
//
//  Created by xdmgzdev on 14/04/2021.
//

public enum Error: Swift.Error {
  case operationCancelled
  case requestFailed(error: Swift.Error)
  case unknownStatusCode
  case unexpectedStatusCode(code: Int)
  case contentEmptyData
  case contentDecoding(error: Swift.Error)
}
