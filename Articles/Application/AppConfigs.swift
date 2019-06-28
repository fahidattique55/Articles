//
//  AppConfigs.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import Foundation


// MARK:- App Environment

enum AppMode: Int {
    
    case dev = 0, staging, production
}


var appMode: AppMode {
    get {
        return .dev
    }
}









// MARK:- App Configurations

let appConfigs = AppConfigs.sharedInstance

class AppConfigs {
    
    // MARK:- Static Properties
    
    static let sharedInstance = AppConfigs()

    // MARK:- Class Properties

    var baseURL: String {
        get {
            switch appMode {
                
            case .dev:
                return "https://api.nytimes.com/svc/"
                
            case .staging:
                return "https://api.nytimes.com/svc/"
                
            case .production:
                return "https://api.nytimes.com/svc/"
            }
        }
    }

    let apiKey = "KunOyGtlw5R9mU2MTzXhjaupOyi7wQdo"
}
