//
//  API+Details.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 7/1/2023.
//

import Foundation
import Alamofire

extension API {
    enum DetailsController {
        var teamDetailsUrl: String { return "/searchteams.php" }
        case getTeamDetails(team: String)
    }
}


extension API.DetailsController: NetworkUrl {
    
    var method: HTTPMethod {
        switch self {
        case .getTeamDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getTeamDetails:
            return self.teamDetailsUrl
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        switch self {
        case .getTeamDetails(let team):
            return ["t":team]
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getTeamDetails:
            return Network.unsecureHeaders
        }
    }
}
