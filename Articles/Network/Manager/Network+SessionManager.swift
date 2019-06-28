//
//  MySessionManager.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit
import Alamofire

class MySessionManager: SessionManager {

    override func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
     
        let request = super.request(urlRequest)
        request.responseString { (responseString) in
            if let url = urlRequest.urlRequest?.url { print(url) }
            print(responseString)
        }
        return request
    }
}
