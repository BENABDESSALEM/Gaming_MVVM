//
//  Network.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Alamofire

public struct Network {
    
    // MARK: Public Static Properties
    
    static let manager = Alamofire.SessionManager(configuration: Network.defaultSession())
    
    // MARK: Private Static Methods
    
    private static func defaultSession() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.httpMaximumConnectionsPerHost = 6 // Default value is 6
        configuration.timeoutIntervalForRequest = 60 // Default value is 60 seconds
        configuration.requestCachePolicy = .reloadIgnoringCacheData // To return 304 and not 200
        return configuration
    }
}
