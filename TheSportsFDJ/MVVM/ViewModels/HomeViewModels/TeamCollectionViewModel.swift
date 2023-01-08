//
//  TeamCollectionViewModel.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 7/1/2023.
//

import Foundation

class TeamCollectionViewModel: BaseCellViewModel {
    var team: Team?
    
    init(team: Team) {
        self.team = team
    }
}
