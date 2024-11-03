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
    var coreDataViewModel : CoreDataViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
}
//MARK: - IBActions
private extension DetailsViewController {
    @IBAction func addToFavourite(_ sender: Any) {
        coreDataViewModel?.articlesDataBase.saveArticle(newArticle: displayedArticle!)
        let addAlert : UIAlertController  = UIAlertController(title:displayedArticle?.title, message:"added to favourite successfully", preferredStyle: .alert)
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:{ [self] action in
            navigationController?.popViewController(animated: true)
        }))
        self.present(addAlert, animated:true, completion:nil )
    }
}
extension DetailsViewController {
  
  func configureViews() {
      coreDataViewModel = CoreDataViewModel()
      displayedArticleTitle.text = displayedArticle?.title
      displayedArticleAuthor.text = displayedArticle?.author
      displayedArticleContent.text = displayedArticle?.content
      backgroundView.layer.cornerRadius = 24.05
      displayedArticleAuthor.layer.cornerRadius = 20
      displayedArticleAuthor.layer.masksToBounds = true
  }
}

