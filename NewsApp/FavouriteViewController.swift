//
//  FavouriteViewController.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 03/11/2024.
//

import UIKit
import CoreData

class FavouriteViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var favouriteArticlesCollectionView: UICollectionView!
    
    var favouriteViewModel : FavouriteViewModelProtocol = FavouriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        favouriteViewModel.fetchArticleFromFavourites()
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return favouriteViewModel.fetchedArticles?.count ?? 0
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! ArticlesCollectionViewCell
      cell.configureCell(image:favouriteViewModel.fetchedArticles?[indexPath.row].value(forKey: "image") as! String, title: favouriteViewModel.fetchedArticles?[indexPath.row].value(forKey: "title") as! String, author: favouriteViewModel.fetchedArticles?[indexPath.row].value(forKey: "author") as! String, content: favouriteViewModel.fetchedArticles?[indexPath.row].value(forKey: "content") as! String)
    return cell
  }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension FavouriteViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (UIScreen.main.bounds.size.width/2)-27.5,height: (UIScreen.main.bounds.size.height/3)-44)
  }
}

extension FavouriteViewController {
  
  func configureViews() {
      favouriteArticlesCollectionView.dataSource = self
      favouriteArticlesCollectionView.delegate = self
      let nib = UINib(nibName: "ArticlesCollectionViewCell", bundle: nil)
      favouriteArticlesCollectionView.register(nib, forCellWithReuseIdentifier: "articleCell")
  }
}
