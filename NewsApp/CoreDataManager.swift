//
//  CoreDataManager.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import UIKit
import CoreData

//MARK: - CoreDataManagerProtocol
protocol CoreDataManagerProtocol {
  func saveArticle(newArticle : Articles)
  func fetchArticles()-> [NSManagedObject]?
}

//MARK: - CoreDataManager
class CoreDataManager : CoreDataManagerProtocol {
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  let managedContext : NSManagedObjectContext!
  let entity : NSEntityDescription!
  
  private static var articleInstance : CoreDataManager?
  
  public static func getArticleInstance() -> CoreDataManager {
    if let instance = articleInstance {
      return instance
    }else{
      articleInstance = CoreDataManager()
      return articleInstance!
    }
  }
  
  private init () {
    managedContext = appDelegate.persistentContainer.viewContext
    entity = NSEntityDescription.entity(forEntityName: "FavoriteArticles", in: managedContext)
  }
  
  func saveArticle(newArticle : Articles) {
    let article = NSEntityDescription.insertNewObject(forEntityName: "FavoriteArticles", into: managedContext)
    article.setValue(newArticle.author, forKey: "author")
    article.setValue(newArticle.title, forKey: "title")
    article.setValue(newArticle.description, forKey: "descriptions")
    article.setValue(newArticle.url, forKey: "url")
    article.setValue(newArticle.urlToImage, forKey: "image")
    article.setValue(newArticle.publishedAt, forKey: "publishedAt")
    article.setValue(newArticle.content, forKey: "content")
    try?self.managedContext.save()
  }
  
  func fetchArticles() -> [NSManagedObject]? {
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteArticles")
    if let arr = try? managedContext.fetch(fetchRequest) {
      if arr.count > 0 {
        return arr
      }
      return nil
    }else{
      return nil
    }
  }
}
