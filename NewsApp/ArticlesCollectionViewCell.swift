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
    @IBOutlet private weak var articleContent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellView()
    }
    func configureCell(image: String, title: String, author: String, content: String) {
        let url = URL(string: "https://media.wired.com/photos/6703eb3979f13fda7f04485b/191:100/w_1280,c_limit/Satoshi-Nakamoto-biz-1341874258.jpg")
       // if let url = URL(string: image){        articleImage.kf.setImage(with:url)}
     //   let encodedUrl = image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
       // articleImage.image = UIImage(named: "articleImage")
        articleImage.kf.setImage(with:url, placeholder: UIImage(systemName: "articleImage"))
        articleTitle.text = title
        articleAuthor.text = author
        articleContent.text = content
    }
}

extension ArticlesCollectionViewCell {
    func configureCellView() {
        self.layer.cornerRadius = 11.36
        self.articleAuthor.layer.cornerRadius = 11.25
        self.articleAuthor.layer.masksToBounds = true
    }
}
