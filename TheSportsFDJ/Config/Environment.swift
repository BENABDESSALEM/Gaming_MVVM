//
//  Environment.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation

enum Environment {
    
    // MARK: Api
    
    enum Api {
        static let apiKey: String = "50130162"
        static let baseUrl: String = "https://www.thesportsdb.com/api/v1/json/"
        static let basePath: String = baseUrl + apiKey
    }
    
}
