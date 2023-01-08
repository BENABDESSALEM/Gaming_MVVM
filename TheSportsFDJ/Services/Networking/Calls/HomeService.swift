//
//  HomeService.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 8/1/2023.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol {
    func getLeaguesList(onSuccess: @escaping (_ response: AllLeaguesResponse?) -> Void, onError: @escaping (_ error: TheSportsError?) -> Void)
    func getAllTeams(querySearch: String,onSuccess: @escaping (_ response: SearchAllTeamsResponse?) -> Void, onError: @escaping (_ error: TheSportsError?) -> Void)
}

final class HomeService:HomeServiceProtocol {
    
    func getLeaguesList(onSuccess: @escaping (_ response: AllLeaguesResponse?) -> Void, onError: @escaping (_ error: TheSportsError?) -> Void) {
        do {
            let api = API.HomeController.getAvailableLeagueList
            let urlRequest = try api.asURLRequest()
            
            (Network.manager as SessionManager)
                .request(urlRequest)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success:
                        if let result: AllLeaguesResponse = ApiCall.decodeResponse(response: response) {
                            onSuccess(result)
                        } else {
                            onSuccess(nil)
                        }
                    case .failure:
                        onError(ApiCall.decodeError(response: response))
                    }
                })
        } catch _ {
            onError(nil)
        }
    }
    
    func getAllTeams(querySearch: String,onSuccess: @escaping (_ response: SearchAllTeamsResponse?) -> Void, onError: @escaping (_ error: TheSportsError?) -> Void) {
        do {
            let api = API.HomeController.getAllTeamsList(league: querySearch)
            let urlRequest = try api.asURLRequest()
            
            (Network.manager as SessionManager)
                .request(urlRequest)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success:
                        if let result: SearchAllTeamsResponse = ApiCall.decodeResponse(response: response) {
                            onSuccess(result)
                        } else {
                            onSuccess(nil)
                        }
                    case .failure:
                        onError(ApiCall.decodeError(response: response))
                    }
                })
        } catch _ {
            onError(nil)
        }
    }
}
