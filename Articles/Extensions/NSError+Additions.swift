//
//  NSError+Additions.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import Foundation

let appDomain = "com.articles"
let generalAppError = "Please try again!"

public extension NSError {

    convenience init(errorMessage:String?, code: Int? = nil) {
        var errorMessage = errorMessage
        if errorMessage == nil { errorMessage = generalAppError }
        var errorCode = -1
        if let code = code { errorCode = code }
        self.init(domain: appDomain, code: errorCode, userInfo: [NSLocalizedDescriptionKey: errorMessage!])
    }
}
