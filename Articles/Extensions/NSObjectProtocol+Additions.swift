//
//  NSObjectProtocol+Additions.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit

extension NSObjectProtocol {
    
    static var identifier: String { return String(describing: self) }
}
