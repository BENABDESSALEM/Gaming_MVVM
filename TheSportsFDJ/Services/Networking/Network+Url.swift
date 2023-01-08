//
//  Network+Url.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Alamofire

protocol NetworkUrl: URLRequestConvertible {
    
    // MARK: URLRequestConvertible
    
    var method: HTTPMethod { get }
    var path: String { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders { get }
}


extension NetworkUrl {
    
    func asURLRequest() throws -> URLRequest {
        let urlString = Environment.Api.basePath + self.path
        guard
            let url = URL(string: urlString),
            let urlRequest = try? URLRequest(url: url, method: self.method, headers: self.headers),
            let encodedURLRequest = try? self.encoding.encode(urlRequest, with: self.parameters)
            else {
                throw Network.Error.encodingError
        }
        print("=================# API Request #=================\n")
        print("****** Request Path: ", urlString)
        print("****** Request Method: ", method)
        print("****** Request Headers: ", headers)
        print("****** Request parameters: ", parameters ?? [:])
        return encodedURLRequest
    }
}
