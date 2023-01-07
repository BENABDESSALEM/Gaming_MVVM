//
//  HomeViewModel.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation
import Combine

class HomeViewModel: BaseViewModel {
    
    @Published var searchQuery = ""
    private var subscriptions = Set<AnyCancellable>()

    var reloadTableData: (() -> Void)?
    var reloadCollectionData: (() -> Void)?
    var leagues = [League]()
    var teams = [Team]() {
        didSet {
            reloadCollectionData?()
        }
    }
    var filtredLeagues = [League]() {
        didSet {
            reloadTableData?()
        }
    }
    var leagueToSearch = String() {
        didSet {
            getAllTeams(querySearch: leagueToSearch)
        }
    }
    
    override init() {
        super.init()
        self.getLeaguesList()
        self.bindSearchQuery()
     }
    
    private func getLeaguesList() {
        ApiCall.Home.getLeaguesList(onSuccess: self.onSuccess, onError: self.onFail)
    }
    
    private func getAllTeams(querySearch:String){
        self.isLoading = true
        ApiCall.Home.getAllTeams(querySearch: querySearch, onSuccess: self.onSuccess, onError: self.onFail)
    }
    
    private func bindSearchQuery() {
           $searchQuery
               .receive(on: RunLoop.main)
               .removeDuplicates()
               .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
               .sink { [weak self] value in
                   self?.autoCompleteSearchLeague()
               }.store(in: &subscriptions)
    }
    
    private func autoCompleteSearchLeague() {
        guard !searchQuery.isEmpty else {
            return
        }
        filtredLeagues = leagues.filter { $0.strLeague!.lowercased().contains(searchQuery.lowercased()) }
    }
}

extension HomeViewModel {
    // MARK: WS Callbacks
    
    private func onSuccess(_ response: AllLeaguesResponse?) {
        guard let response = response else { return }
        if let leaguesList = response.leagues {
            leagues = leaguesList
        }
    }
    
    private func onSuccess(_ response: SearchAllTeamsResponse?) {
        self.isLoading = false
        guard let response = response else { return }
        if let allTeamsList = response.teams {
            var lst:[Team] = allTeamsList
            lst = lst.sorted(by: { (team1, taam2) -> Bool in
               let teamName1 = team1.strTeam ?? ""
               let teamName2 = taam2.strTeam ?? ""
               return (teamName1.localizedCaseInsensitiveCompare(teamName2) == .orderedDescending)
            })
            teams = lst
        }
    }
    
    private func onFail(_ error: TheSportsError?) {
        self.isLoading = false
    }
}
