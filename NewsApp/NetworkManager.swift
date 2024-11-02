//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import Foundation
//MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
  func request<T:Decodable>(path : Path,completion: @escaping Completion<T>)
}

//MARK: - NetworkService
final class NetworkService: NetworkServiceProtocol {
  //MARK: - URL Creation
  func createURL(path: Path) -> URL? {
    let baseURL = "https://newsapi.org/v2/"
    var url = baseURL + path.stringValue
    return URL(string: url)
  }
  
  //MARK: - Network Request
  func request<T>(path: Path, completion: @escaping Completion<T>) where T : Decodable {
    guard let url = createURL(path: path) else {
      completion(.failure(Error.self as! Error))
      return
    }
    let request = URLRequest(url: url)        
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: request) {data, response, error in
      guard let data = data else {
        completion(.failure(Error.self as! Error))
        return
      }
      do {
        let result = try JSONDecoder().decode(T.self, from: data)
        completion(.success(result))
      }catch{
        completion(.failure(Error.self as! Error))
      }
    }
    task.resume()
  }
}
public typealias Completion<T> = (_ result: Result<T, Error>) -> Void
