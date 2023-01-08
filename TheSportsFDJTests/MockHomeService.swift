//
//  MockHomeService.swift
//  TheSportsFDJTests
//
//  Created by Wajih Benabdessalem on 8/1/2023.
//

@testable import TheSportsFDJ

final class MockHomeService: HomeServiceProtocol {
    func getLeaguesList(onSuccess: @escaping (AllLeaguesResponse?) -> Void, onError: @escaping (TheSportsError?) -> Void) {
        let leagues = [
           League(idLeague: "4328", strLeague: "English Premier League", strSport: "Soccer", strLeagueAlternate: "Premier League"),
           League(idLeague: "4329", strLeague: "English League Championship", strSport: "Soccer", strLeagueAlternate: "Championship"),
           League(idLeague: "4330", strLeague: "Scottish Premier League", strSport: "Soccer", strLeagueAlternate: "Scottish Premiership"),
           League(idLeague: "4331", strLeague: "German Bundesliga", strSport: "Soccer", strLeagueAlternate: "Bundesliga, Fußball-Bundesliga")
        ]
        onSuccess(AllLeaguesResponse(leagues: leagues))
    }
    
    func getAllTeams(querySearch: String, onSuccess: @escaping (SearchAllTeamsResponse?) -> Void, onError: @escaping (TheSportsError?) -> Void) {
        onSuccess(SearchAllTeamsResponse(teams: []))
    }
}
