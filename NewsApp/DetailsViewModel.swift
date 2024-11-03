//
//  DetailsViewModel.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 03/11/2024.
//

import Foundation
import CoreData

//MARK: - DetailsViewModelProtocol
protocol DetailsViewModelProtocol {
    func saveArticleToFavourite(article: Articles)
}

//MARK: - DetailsViewModel
class DetailsViewModel: DetailsViewModelProtocol {
    private let detailsRepository: DetailsRepositoryProtocol = DetailsRepository()
    
    func saveArticleToFavourite(article: Articles) {
        detailsRepository.saveFavouriteArticles(article: article)
    }
}
