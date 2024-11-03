//
//  ArticlesCollectionViewCell.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import UIKit
import Kingfisher

class ArticlesCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet private weak var articleImage: UIImageView!
    @IBOutlet private weak var articleTitle: UILabel!
    @IBOutlet private weak var articleAuthor: UILabel!
    @IBOutlet private weak var articleContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellView()
    }
    func configureCell(image: String, title: String, author: String, content: String) {
        articleImage.kf.setImage(with: URL(string: image), placeholder: UIImage(named: "noImage"))
        articleTitle.text = title
        articleAuthor.text = author
        articleContent.text = content
    }
}

extension ArticlesCollectionViewCell {
    func configureCellView() {
        self.layer.cornerRadius = 11.36
        self.articleAuthor.layer.cornerRadius = 6
        self.articleAuthor.layer.masksToBounds = true
        self.articleImage.layer.cornerRadius = 10
        self.articleImage.layer.masksToBounds = true
    }
}
