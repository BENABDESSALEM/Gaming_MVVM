//
//  InfoTableViewModel.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 7/1/2023.
//

import Foundation

class InfoTableViewModel: BaseCellViewModel {
    
    var teamBanner: String?
    var teamCountry: String?
    var teamLeague: String?

    init(teamBanner: String,teamCountry: String,teamLeague: String) {
        self.teamBanner = teamBanner
        self.teamCountry = teamCountry
        self.teamLeague = teamLeague
    }
}
