//
//  Network+Headers.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Alamofire

extension Network {
    static var unsecureHeaders: HTTPHeaders {
        let header = [ "Content-Type": "application/json" ]
        return header
    }
}
