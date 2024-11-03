//
//  FavouriteViewController.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 03/11/2024.
//

import UIKit

class FavouriteViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var favouriteArticlesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 9
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! ArticlesCollectionViewCell
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
