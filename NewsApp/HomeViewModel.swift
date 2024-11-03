//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import Foundation

//MARK: - HomeViewModelProtocol
protocol HomeViewMode1Protocol {
    func getArticles ()
    var bindArticlesToHomeController: (() -> ()) {get set}
    var retrievedArticles: NewsModel? {get set}
    var articles: NewsModel? {get set}
}

//MARK: - HomeViewModel
class HomeViewModel: HomeViewMode1Protocol {
    private let homeRepository: HomeRepositoryProtocol = HomeRepository ()
    
    var bindArticlesToHomeController: (() -> ()) = {}
    
    var retrievedArticles: NewsModel? {
        didSet {
            bindArticlesToHomeController()
        }
    }
    
    var articles: NewsModel?
    
    func getArticles () {
        homeRepository.getHomeArticles(search: "bitcoin") { result in
            switch result {
            case .success(let success):
                self.retrievedArticles = success
                //print("articles: \(success)")
            case .failure(let error):
                print("Failed to get articles: \(error.localizedDescription)")
            }
        }
    }
}
