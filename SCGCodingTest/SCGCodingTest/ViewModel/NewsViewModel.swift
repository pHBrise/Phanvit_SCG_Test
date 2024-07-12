//
//  MainInteractor.swift
//  SCGCodingTest
//
//  Created by Phanvit Chevamongkolnimit on 12/7/2567 BE.
//

import Foundation

protocol NewsModelProtocol {
    var articles: [Article] { get }
    var error:Error? {get}
    func fetchNews(completion: @escaping (_ success:Bool)->())
}

class NewsViewModel: NewsModelProtocol {
    var error: Error?
    var articles: [Article] = []
    func fetchNews(completion: @escaping (Bool) -> ()) {
        APINews().requestParameters(NewsAPIRouter.keyword(keyword: "bitcoin")) {[weak self] (response: NewsResponseModel?) in
            self?.articles = response?.articles ?? []
            completion(true)
        } errorHandler: {[weak self] (error: Error) in
            self?.error = error
            completion(false)
        }
    }

}
