//
//  Constant.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import Foundation
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
