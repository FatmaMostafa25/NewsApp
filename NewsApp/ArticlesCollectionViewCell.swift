//
//  ArticlesCollectionViewCell.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet private weak var articleImage: UIImageView!
    @IBOutlet private weak var articleTitle: UILabel!
    @IBOutlet private weak var articleAuthor: UILabel!
    @IBOutlet private weak var articleContent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

}

extension ArticlesCollectionViewCell {
    func configureCell() {
        self.layer.cornerRadius = 11.36
        self.articleAuthor.layer.cornerRadius = 11.25
        self.articleAuthor.layer.masksToBounds = true
    }
}
