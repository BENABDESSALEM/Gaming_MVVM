//
//  ApiCall.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 6/1/2023.
//

import Alamofire

public struct ApiCall {
    
    // MARK: Private Static Methods
    
    private static func decodeResponse<T: Decodable>(data: Data?) -> T? {
        if  let data = data {
            let decoder = JSONDecoder()
            return try? decoder.decode(T.self, from: data)
        }
        return nil
    }
    
    // MARK: Public Static Methods
    
    static func decodeResponse<T: Decodable>(response: DataResponse<Any>) -> T? {
        return ApiCall.decodeResponse(data: response.data)
    }
    
    static func decodeError<T: Any>(response: DataResponse<T>) -> TheSportsError? {
        if let statusCode = response.response?.statusCode, statusCode == 401 {
            // we show a popup to the user in case of error was happen.
        }
        return ApiCall.decodeResponse(data: response.data)
    }
}
