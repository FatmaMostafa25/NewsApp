//
//  Articles.swift
//  NewsApp
//
//  Created by Fatma Mostafa on 02/11/2024.
//

import Foundation

struct NewsModel : Codable {
    let status : String
    let totalResults : Int
    let articles : [Articles]
}

struct Articles : Codable {
    let source : Source?
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
