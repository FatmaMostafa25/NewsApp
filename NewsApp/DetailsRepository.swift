//
//  DetailsRepository.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 03/11/2024.
//

import Foundation

//MARK: DetailsRepositoryProtocol
protocol DetailsRepositoryProtocol {
    func saveFavouriteArticles(article: Articles)
}
//MARK: - DetailsRepository
class DetailsRepository: DetailsRepositoryProtocol {
    private let coreData: CoreDataManagerProtocol = CoreDataManager.getArticleInstance()

    func saveFavouriteArticles(article: Articles) {
        coreData.saveArticle(newArticle: article)
    }
}
