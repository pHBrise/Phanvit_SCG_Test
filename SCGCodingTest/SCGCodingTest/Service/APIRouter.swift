//
//  APIRouter.swift
//  SCGCodingTest
//
//  Created by Phanvit Chevamongkolnimit on 6/7/2567 BE.
//

import Foundation
import Alamofire

enum NewsAPIRouter {
    
    case sort(sortBy:SortNews, keyword:String)
    case keyword(keyword:String)
    
    var baseURL: URL {
        URL(string:"https://newsapi.org/v2")!
    }
    
    var apiKey:String {
        "ENTER_YOUR_APIKEY"
    }
    
    var method: HTTPMethod {
        switch self {
        case .sort, .keyword:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .sort, .keyword:
            return "/everything"
        }
    }
    
    var headers: HTTPHeaders {
        return ["X-Api-Key": apiKey]
    }
    
    var parameters:Parameters? {
        switch self {
        case let .sort(sortBy, keyword):
            return ["q":keyword, "sortBy":sortBy.rawValue]
        case let .keyword(keyword):
            return ["q":keyword]
        }
    }
}

extension NewsAPIRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = headers
        if let parameters = parameters {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
}
