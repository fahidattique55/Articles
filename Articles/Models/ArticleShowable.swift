//
//  ArticleShowable.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import Foundation
import UIKit

protocol ArticleShowable {
    
    var title: String! { get set }
    var publicationDateString: String! { get set }
}
