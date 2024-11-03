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

    var displayedArticle: Articles?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

}

extension DetailsViewController {
  
  func configureViews() {
      displayedArticleTitle.text = displayedArticle?.title
      displayedArticleAuthor.text = displayedArticle?.author
      displayedArticleContent.text = displayedArticle?.content

      backgroundView.layer.cornerRadius = 24.05
      displayedArticleAuthor.layer.cornerRadius = 20
      displayedArticleAuthor.layer.masksToBounds = true
  }
}

