//
//  Article.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit
import ObjectMapper

class Article: NSObject, Mappable, ArticleShowable {

    // MARK: - Article Showable

    var title: String!
    var publicationDateString: String!


    // MARK: - Properties

    private var publicationDateFromServer: String!
    var publicationDate: Date!
    var headline: Headline!
    
    // MARK: - JSON Mapping

    required init?(map: Map) { }

    func mapping(map: Map) {
        publicationDateFromServer <- map["pub_date"]
        if let dateString = publicationDateFromServer {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"
            publicationDate = formatter.date(from: dateString)
            formatter.dateFormat = "yyyy-MM-dd"
            publicationDateString = formatter.string(from: publicationDate)
        }
        headline <- map["headline"]
        title = headline?.main ?? ""
    }
}

