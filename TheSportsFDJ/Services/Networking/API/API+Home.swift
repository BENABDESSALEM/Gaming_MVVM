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
        case .getAllTeamsList:
            return self.teamsUrl
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        switch self {
        case .getAvailableLeagueList:
            return nil
        case .getAllTeamsList(let query):
            return ["l":query]
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getAvailableLeagueList, .getAllTeamsList:
            return Network.unsecureHeaders
        }
    }
}
