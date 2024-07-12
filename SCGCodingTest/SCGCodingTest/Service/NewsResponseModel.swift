//
//  NewsResponseModel.swift
//  SCGCodingTest
//
//  Created by Phanvit Chevamongkolnimit on 11/7/2567 BE.
//

import Foundation


struct NewsResponseModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}


