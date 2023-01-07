//
//  Network+Error.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Alamofire

extension Network {
    
    enum Error: Swift.Error {
        
        case unknown (response: DataResponse<Any>)
        case unauthorized
        case encodingError
        case url
        case jsonDecoder(underlying: Swift.Error)
        
        var localizedDescription: String {
            switch self {
            case .jsonDecoder(let underlying):
                return underlying.localizedDescription
            case .unknown(let response):
                return response.debugDescription
            default:
                return "An error was occured"
            }
        }
    }
}
