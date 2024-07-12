//
//  APIManager.swift
//  SCGCodingTest
//
//  Created by Phanvit Chevamongkolnimit on 11/7/2567 BE.
//

import Alamofire
import Foundation

protocol APIProtocol {
    func requestParameters<T>(_ request: NewsAPIRouter, completionHandler: @escaping (T?) -> Void, errorHandler: @escaping (Error) -> Void) where T : Decodable, T : Encodable
}

public class APINews:APIProtocol {
    func requestParameters<T>(_ request: NewsAPIRouter, completionHandler: @escaping (T?) -> Void, errorHandler: @escaping (Error) -> Void) where T : Decodable, T : Encodable {
        do {
            let   urlRequest = try request.asURLRequest()
            AF.request(urlRequest).validate().responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value)
                case .failure(let error):
                    errorHandler(error)
                }
            }
        } catch {
            errorHandler(AFError.createURLRequestFailed(error: error))
        }
    }
    
}
