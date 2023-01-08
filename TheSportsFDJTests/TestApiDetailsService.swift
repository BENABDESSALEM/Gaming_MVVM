//
//  TestApiDetailsService.swift
//  TheSportsFDJTests
//
//  Created by Wajih Benabdessalem on 8/1/2023.
//

import XCTest
@testable import TheSportsFDJ

class TestApiDetailsService: TheSportsDBBaseTest {

    var mockDetailsService: MockDetailsService!
    var viewModel: DetailsViewModel!
    
    override func setUp() {
        super.setUp()
        mockDetailsService = MockDetailsService()
        viewModel = .init(apiService: mockDetailsService, query: "English Premier League")
        // When start fetch
        viewModel.getTeamDetails()
    }
    
    func testDetailsApiRequestSetsSuccessPresentedToTrue() {
        // Assert
        XCTAssertTrue(viewModel.isSuccessPresented,"Response should be successed")
        XCTAssertNotNil(viewModel.teamDetail,"Response should not be null")
    }
    
    func testTeamDetailsResponseData() {
        // Assert
        XCTAssertNotNil(viewModel.teamName,"Team name item should not be null")
        XCTAssertNotNil(viewModel.teamDetail?.strTeamBanner,"Team Banner item should not be null")
        XCTAssertNotNil(viewModel.teamDetail?.strCountry,"Country item should not be null")
        XCTAssertNotNil(viewModel.teamDetail?.strLeague,"League name item should not be null")
        XCTAssertNotNil(viewModel.teamDetail?.strDescriptionEN,"DescriptionEN item should not be null")
    }
}
