//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import UIKit

class HomeViewController: UIViewController {
  //MARK: - IBOutlets
  @IBOutlet private weak var screenTitle: UILabel!
  @IBOutlet private weak var articlesSearchBar: UISearchBar!
  @IBOutlet private weak var articlesDatePicker: UIDatePicker!
  @IBOutlet private weak var homeArticlesCollectionView: UICollectionView!
  
  var homeViewModel: HomeViewMode1Protocol = HomeViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
    
      homeViewModel.getArticles()
    homeViewModel.bindArticlesToHomeController = {
      DispatchQueue.main.async{
        self.homeViewModel.articles = self.homeViewModel.retrievedArticles
        self.homeArticlesCollectionView.reloadData()
      }
    }
    
  }
}

//MARK: - IBActions
private extension HomeViewController {
  
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! ArticlesCollectionViewCell
    cell.configureCell(image: homeViewModel.articles?.articles[indexPath.row].urlToImage ?? "", title: homeViewModel.articles?.articles[indexPath.row].title ?? "", author: homeViewModel.articles?.articles[indexPath.row].author ?? "", content: homeViewModel.articles?.articles[indexPath.row].content ?? "")

    return cell
  }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (UIScreen.main.bounds.size.width/2)-27.5,height: (UIScreen.main.bounds.size.height/3)-44)
  }
}

extension HomeViewController {
  
  func configureViews() {
    homeArticlesCollectionView.dataSource = self
    homeArticlesCollectionView.delegate = self
    let nib = UINib(nibName: "ArticlesCollectionViewCell", bundle: nil)
    homeArticlesCollectionView.register(nib, forCellWithReuseIdentifier: "articleCell")
  }
}
