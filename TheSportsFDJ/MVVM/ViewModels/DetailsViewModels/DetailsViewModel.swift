//
//  DetailsViewModel.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation

class DetailsViewModel: BaseViewModel {
    
    private let apiService: DetailsServiceProtocol
    var reloadTableData: (() -> Void)?
    @Published fileprivate var myBoolean:Bool = false
    var isSuccessPresented = false
    var query: String?
    var teamDetail: Team?
    var teamName: String?
    var items = [BaseCellViewModel](){didSet{self.reloadTableData?()}}
    
    init(apiService:DetailsServiceProtocol = DetailsService(),query: String) {
        self.apiService = apiService
        self.query = query
    }
    
    func updateItems(){
        guard let teamName = teamDetail?.strTeam,
              let teamBanner = teamDetail?.strTeamBanner,
              let teamCountry = teamDetail?.strCountry,
              let teamLeague = teamDetail?.strLeague,
              let teamDescription = teamDetail?.strDescriptionEN
        else { return }
        var data:[BaseCellViewModel] = []
        self.teamName = teamName
        data.removeAll()
        items.removeAll()
        let info = InfoTableViewModel(teamBanner: teamBanner, teamCountry: teamCountry, teamLeague: teamLeague)
        data.append(info)
        let description = DescriptionTableViewModel(teamDescription: teamDescription)
        data.append(description)
        items = data
    }
    
    func getTeamDetails(){
        self.isLoading = true
        apiService.getTeamDetails(querySearch: self.query ?? "", onSuccess: self.onSuccess, onError: self.onFail)
    }
}

// MARK: WS Callbacks

extension DetailsViewModel {
    
    private func onSuccess(_ response: SearchAllTeamsResponse?) {
        self.isLoading = false
        guard let response = response else { return }
        if let teamsList = response.teams {
            teamDetail = teamsList.first
            updateItems()
        }
        isSuccessPresented = true
    }
    
    private func onFail(_ error: TheSportsError?) {
        print(error.debugDescription)
        self.isLoading = false
        isSuccessPresented = false
    }
}
