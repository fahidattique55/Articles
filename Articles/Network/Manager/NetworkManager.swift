//
//  NetworkManager.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit
import Alamofire


let networkManager = NetworkManager.shareInstance

class NetworkManager {
    
    // MARK:- Static Properties

    static let shareInstance = NetworkManager()

    // MARK:- Class Properties

    var sessionManager = MySessionManager()

    // MARK:- Life Cycle

    private init() {
        sessionManager.session.configuration.timeoutIntervalForRequest = 15
    }
    
    // MARK:- API Calling
    
    @discardableResult
    func request(_ method: ServiceMethod, service: Directable, parameters: [String: Any]?, isAuthorized: Bool, encoding: ParameterEncoding, success: SuccessJSONBlock!, failure: FailureErrorBlock!) -> Request? {
        if method == .post || method == .put || method == .patch { print(parameters as Any) }
        let urlString = service.directableURLString()
        let request = sessionManager.request(urlString, method: method.urlMethod, parameters: parameters, encoding: encoding, headers: getAuthorizationHeaders(isAuthorized)).responseJSON { (response) in
            self.handleServerResponse(response, success: success, failure: failure)
        }
        return request
    }
    
    // MARK:- Headers
    
    func getAuthorizationHeaders(_ authorized: Bool) -> [String : String]? {
        
        let headers = [String:String]()
        if authorized {
            //  In case of any authorization headers
        }
        return headers
    }
    
    // MARK:- Handle Response
    
    func handleServerResponse(_ response: DataResponse<Any>, success: SuccessJSONBlock!, failure: FailureErrorBlock!) {
        //        if self.checkForError(response, failure: failure) { return }
        let responseData = response.response
        success(responseData, response.result.value)
    }
    
    //MARK: - Error Handling
}
