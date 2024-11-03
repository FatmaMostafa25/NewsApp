//
//  FavouriteRepository.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 03/11/2024.
//

import Foundation
import CoreData

//MARK: FavouriteRepositoryProtocol
protocol FavouriteRepositoryProtocol {
    func fetchFavouriteArticles() -> [NSManagedObject]
}
//MARK: - FavouriteRepository
class FavouriteRepository: FavouriteRepositoryProtocol {
    private let coreData: CoreDataManagerProtocol = CoreDataManager.getArticleInstance()

    func fetchFavouriteArticles() -> [NSManagedObject]{
        return coreData.fetchArticles() ?? []
    }
}
