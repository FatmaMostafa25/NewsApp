//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 03/11/2024.
//

import UIKit

class DetailsViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var displayedArticleImage: UIImageView!
    @IBOutlet private weak var displayedArticleTitle: UILabel!
    @IBOutlet private weak var displayedArticleAuthor: UILabel!
    @IBOutlet private weak var displayedArticleContent: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

}

extension DetailsViewController {
  
  func configureViews() {
      backgroundView.layer.cornerRadius = 24.05
      
      displayedArticleAuthor.layer.cornerRadius = 20
      displayedArticleAuthor.layer.masksToBounds = true
  }
}

