//
//  LeagueTableViewModel.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 6/1/2023.
//

import Foundation

class LeagueTableViewModel: BaseCellViewModel {
    var league: League?
    
    init(league: League) {
        self.league = league
    }
}
