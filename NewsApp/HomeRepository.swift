//
//  HomeRepository.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import Foundation

//MARK: HomeRepositoryProtocol
protocol HomeRepositoryProtocol {
    func getHomeArticles (search: String, completion: @escaping Completion<NewsModel>)
    func getArticlesFilteredByDate(date: String, completion: @escaping Completion<NewsModel>)
}
//MARK: - HomeRepository
class HomeRepository: HomeRepositoryProtocol {
    private let networkService: NetworkServiceProtocol = NetworkService ()

    func getHomeArticles(search: String, completion: @escaping Completion<NewsModel>) {
       networkService.request (path: .everything(search: search), completion: completion)
    }
    func getArticlesFilteredByDate(date: String, completion: @escaping Completion<NewsModel>) {
       networkService.request (path: .filteredByDate(date: date), completion: completion)
    }
}
