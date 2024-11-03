//
//  FavouriteViewModel.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 03/11/2024.
//

import Foundation
import CoreData

//MARK: - FavouriteViewModelProtocol
protocol FavouriteViewModelProtocol {
    func fetchArticleFromFavourites()
    var fetchedArticles: [NSManagedObject]? {get set}
}

//MARK: - FavouriteViewModel
class FavouriteViewModel: FavouriteViewModelProtocol {
    private let favouriteRepository: FavouriteRepositoryProtocol = FavouriteRepository()
    var fetchedArticles: [NSManagedObject]?

    func fetchArticleFromFavourites() {
        fetchedArticles = favouriteRepository.fetchFavouriteArticles()
    }
}
