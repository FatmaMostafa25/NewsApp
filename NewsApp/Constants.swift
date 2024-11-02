//
//  Constant.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import Foundation
//MARK: - Endpoints
enum Path {
  case everything
  
  var stringValue: String {
    switch self {
    case .everything:
      return ""
    }
  }
}
