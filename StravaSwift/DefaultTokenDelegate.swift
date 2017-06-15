//
//  DefaultTokenDelegate.swift
//  Pods
//
//  Created by MATTHEW CLARKSON on 24/05/2016.
//
//

import Foundation
import SwiftyJSON

/**
 The default token delegate. Persists the JSON raw data in NSUserDefaults
**/
open class DefaultTokenDelegate: TokenDelegate {
    fileprivate var token: OAuthToken?
    
    init() {
        if let oauthToken: String = UserDefaults.standard.string(forKey:"oauth-token2") {
            let jsonString = JSON.parse(oauthToken)
            token = OAuthToken(jsonString);
        }
    }
    /**
     Retrieves the token
     
     - Returns: a optional OAuthToken
     **/
    open func get() -> OAuthToken? {
        return token
    }
    
    /**
     Stores the token internally, and saves the token to the NSUserDefaults
     
     - Parameter token: an optional OAuthToken
     **/
    open func set(_ token: OAuthToken?) {
        let _ = UserDefaults.standard.set(token?.jsonData.rawString(), forKey:"oauth-token2");
        self.token = token
    }
}
