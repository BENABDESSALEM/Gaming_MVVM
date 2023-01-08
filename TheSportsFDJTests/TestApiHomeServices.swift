//
//  TestApiHomeServices.swift
//  TheSportsFDJTests
//
//  Created by Wajih Benabdessalem on 8/1/2023.
//

import XCTest
@testable import TheSportsFDJ

class TestApiHomeServices: TheSportsDBBaseTest {

    var mockHomeService: MockHomeService!
    var viewModel: HomeViewModel!
    
    let leagues = [
       League(idLeague: "4328", strLeague: "English Premier League", strSport: "Soccer", strLeagueAlternate: "Premier League"),
       League(idLeague: "4329", strLeague: "English League Championship", strSport: "Soccer", strLeagueAlternate: "Championship"),
       League(idLeague: "4330", strLeague: "Scottish Premier League", strSport: "Soccer", strLeagueAlternate: "Scottish Premiership"),
       League(idLeague: "4331", strLeague: "German Bundesliga", strSport: "Soccer", strLeagueAlternate: "Bundesliga, Fußball-Bundesliga")
    ]
    
    override func setUp() {
        super.setUp()
        mockHomeService = MockHomeService()
        viewModel = .init(apiService: mockHomeService)
    }
    
    func testFetchLeaguesApiRequestSuccess() {
        // When start fetch
        viewModel.getLeaguesList()
        // Assert
        XCTAssertTrue(viewModel.isSuccessPresented,"Response fetch leagues should be successed")
        XCTAssertNotEqual(viewModel.leagues.count,0,"List of leagues should not be empty")
    }

    func testFetchAllTeamsApiRequestSuccess() {
        // Given a success query to start fetch
        let query = "French ligue 1"
        // When start fetch
        viewModel.getAllTeams(querySearch: query)
        // Assert
        XCTAssertEqual(viewModel.isSuccessPresented, true, "Response fetch all teams should be successed")
    }
    
    func testNotEmptyListOfLeagues() {
        viewModel.leagues = leagues
        XCTAssert(viewModel.leagues.count != 0)
        XCTAssertFalse(viewModel.leagues.count == 0)
        XCTAssertNotEqual(viewModel.leagues.count, 0)
    }
    
    func testLowercasedLeagueName() {
        let input = "English Premier League"
        let expectedOutput = "english premier league"
        XCTAssertEqual(input.lowercased(), expectedOutput, "The String is not correctly lowercased.")
    }
    
    func testLeagueNameNotEmpty() throws {
        viewModel.leagues = leagues
        let secondItem =  try XCTUnwrap(viewModel.leagues.first?.strLeague)
        XCTAssertFalse(secondItem.isEmpty)
    }
}
