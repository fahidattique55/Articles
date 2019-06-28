//
//  ArticlesLoader.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

enum ArticleType: Int {
    case emailed = 0, shared, viewed, none
}

class ArticlesLoader {

    func searchArticles(_ parameters: [String: Any]?, successBlock success: @escaping ((_ articles: [Article]) -> Void), failureBlock failure: @escaping ((_ error: NSError?) -> Void)) -> Request? {

        let service = Endpoint.searchArticles

        return networkManager.request(.get, service: service, parameters: parameters, isAuthorized: false, encoding: Encoding.url, success: { (data, responseJSON) in
            
            guard let responseFromServer = responseJSON as? [String : Any] else {
                failure(NSError(errorMessage: Constants.invalidResponse))
                return
            }

            if let response = responseFromServer["response"] as? [String : Any] {
                if let docs = response["docs"] as? [[String : Any]] {
                    let articles = Mapper<Article>().mapArray(JSONObject: docs)  ?? [Article]()
                    success(articles)
                    return
                }
            }
            
            failure(NSError(errorMessage: Constants.invalidResponse))

        }) { (error) in
            failure(error)
        }
    }

    func getArticlesOf(type: ArticleType, _ parameters: [String: Any]?, successBlock success: @escaping ((_ articles: [MostPopularArticle]) -> Void), failureBlock failure: @escaping ((_ error: NSError?) -> Void)) -> Request? {
        
        var service: Directable!
        switch type {
        case .shared:
            service = Endpoint.shared
        case .emailed:
            service = Endpoint.emailed
        case .viewed:
            service = Endpoint.viewed
        default:
            return nil
        }
        
        return networkManager.request(.get, service: service, parameters: parameters, isAuthorized: false, encoding: Encoding.url, success: { (data, responseJSON) in
            
            guard let responseFromServer = responseJSON as? [String : Any] else {
                failure(NSError(errorMessage: Constants.invalidResponse))
                return
            }
            
            if let docs = responseFromServer["results"] as? [[String : Any]] {
                let articles = Mapper<MostPopularArticle>().mapArray(JSONObject: docs)  ?? [MostPopularArticle]()
                success(articles)
                return
            }

            failure(NSError(errorMessage: Constants.invalidResponse))
            
        }) { (error) in
            failure(error)
        }
    }

}
