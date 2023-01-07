//
//  ApiCall+Details.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 7/1/2023.
//

import Alamofire

extension ApiCall {
    
    public struct Details {
        
        public static func getTeamDetails(querySearch: String,onSuccess: @escaping (_ response: SearchAllTeamsResponse?) -> Void, onError: @escaping (_ error: TheSportsError?) -> Void) {
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
}
