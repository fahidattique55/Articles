//
//  NetworkManager+Endpoints.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit
import Alamofire

enum Endpoint: Directable {

    // MARK:- Endpoints

    case searchArticles,
    emailed,
    shared,
    viewed
    
    // MARK:- Directable URL-String
    
    func directableURLString() -> String {
        
        var servicePath = ""
        
        switch (self) {
            
        case .searchArticles:
            servicePath = "search/v2/articlesearch.json"
            
        case .emailed:
            servicePath = "mostpopular/v2/emailed/7.json"
            
        case .shared:
            servicePath = "mostpopular/v2/shared/1/facebook.json"

        case .viewed:
            servicePath = "mostpopular/v2/viewed/1.json"
        }
        
        return appConfigs.baseURL + servicePath
    }
}

struct Encoding {
    
    static let json = JSONEncoding.default
    static let url  = URLEncoding.default
}

/// Returns the url string by appending base, tail and UrlService string ---
/// Make sure to comform this protocol with *Struct UrlService* in your service manager file to return full url strings


public protocol Directable {
    func directableURLString() -> String
}

// Service response closures

public typealias SuccessJSONBlock = (_ response: HTTPURLResponse?, _ result: Any?) -> Void
public typealias FailureErrorBlock = (_ error: NSError?) -> Void

//     Service method types for API calls

public enum ServiceMethod {
    
    case get, post, put, delete, patch
    
    var urlMethod: HTTPMethod {
        
        var method: HTTPMethod
        
        switch self {
        case .get:
            method = .get
            
        case .post:
            method = .post
            
        case .put:
            method = .put
            
        case .delete:
            method = .delete
            
        case .patch:
            method = .patch
            
        }
        return method
    }
}
