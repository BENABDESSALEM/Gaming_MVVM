//
//  DetailsService.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 8/1/2023.
//

import Foundation
import Alamofire

protocol DetailsServiceProtocol {
    func getTeamDetails(querySearch: String,onSuccess: @escaping (_ response: SearchAllTeamsResponse?) -> Void, onError: @escaping (_ error: TheSportsError?) -> Void)
}

final class DetailsService:DetailsServiceProtocol {
    func getTeamDetails(querySearch: String,onSuccess: @escaping (_ response: SearchAllTeamsResponse?) -> Void, onError: @escaping (_ error: TheSportsError?) -> Void) {
        do {
            let api = API.DetailsController.getTeamDetails(team: querySearch)
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
