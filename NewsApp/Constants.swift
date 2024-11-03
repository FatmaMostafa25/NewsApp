//
//  Constant.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import Foundation

//MARK: - NetworkError
public enum NetworkError: Error {
  case invalidResponse
  case invalidURL
  case decodingFailed(Error)
}
//MARK: - Endpoints
enum Path {
  case everything(search: String)
    case filteredByDate(date: String)
  var stringValue: String {
    switch self {
    case let .everything(search: search):
      return "everything?q=\(search)"
    case let .filteredByDate(date: date):
        return "everything?q=bitcoin&from=\(date)"
    }
  }
}
