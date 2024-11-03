//
//  DetailsRepository.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 03/11/2024.
//

import Foundation

//MARK: DetailsRepositoryProtocol
protocol DetailsRepositoryProtocol {
    func saveFavouriteArticles()
}
//MARK: - DetailsRepository
class DetailsRepository: DetailsRepositoryProtocol {
    func saveFavouriteArticles() {
        print("s")
    }
}
