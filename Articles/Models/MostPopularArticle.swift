//
//  MostPopularArticle.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit
import ObjectMapper

class MostPopularArticle: NSObject, Mappable, ArticleShowable {
    
    // MARK: - Article Showable
    
    var title: String!
    var publicationDateString: String!
    
    // MARK: - JSON Mapping
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        title <- map["title"]
        publicationDateString <- map["published_date"]
    }
}

