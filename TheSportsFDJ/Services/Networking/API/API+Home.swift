//
//  API+Home.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation
import Alamofire

extension API {
    enum HomeController {
        var leaguesUrl: String { return "/all_leagues.php" }
        var teamsUrl: String { return "/search_all_teams.php" }
        case getAvailableLeagueList
        case getAllTeamsList(league: String)
    }
}

extension API.HomeController: NetworkUrl {
    
    var method: HTTPMethod {
        switch self {
        case .getAvailableLeagueList, .getAllTeamsList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAvailableLeagueList:
            return self.leaguesUrl
        case .getAllTeamsList(league: let league):
            let query = league.replacingOccurrences(of: " ", with: "%20")
            return self.teamsUrl + "?l=\(query)"
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var parameters: Parameters? {
        switch self {
        case .getAvailableLeagueList, .getAllTeamsList:
            return nil
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getAvailableLeagueList, .getAllTeamsList:
            return Network.unsecureHeaders
        }
    }
}
