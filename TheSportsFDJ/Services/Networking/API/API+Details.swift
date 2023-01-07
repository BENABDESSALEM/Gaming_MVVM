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
        case .getTeamDetails(team: let team):
            let query = team.replacingOccurrences(of: " ", with: "%20")
            return self.teamDetailsUrl + "?t=\(query)"
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var parameters: Parameters? {
        switch self {
        case .getTeamDetails:
            return nil
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getTeamDetails:
            return Network.unsecureHeaders
        }
    }
}
