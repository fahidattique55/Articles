//
//  Headline.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit
import ObjectMapper

class Headline: NSObject, Mappable {

    // MARK: - Properties
    
    var main: String = ""
    
    // MARK: - JSON Mapping
    
    required init?(map: Map) { }

    func mapping(map: Map) {
        main <- map["main"]
    }
}

