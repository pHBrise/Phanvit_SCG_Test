//
//  Arcticle.swift
//  SCGCodingTest
//
//  Created by Phanvit Chevamongkolnimit on 12/7/2567 BE.
//

import Foundation

public struct Article: Codable {
    var source: SourceArticle?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
}


public struct SourceArticle: Codable  {
    var id:String?
    var name:String?
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
