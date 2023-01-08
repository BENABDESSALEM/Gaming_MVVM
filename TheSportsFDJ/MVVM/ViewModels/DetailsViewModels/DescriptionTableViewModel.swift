//
//  DescriptionTableViewModel.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 7/1/2023.
//

import Foundation

class DescriptionTableViewModel: BaseCellViewModel {
    
    var teamDescription: String?

    init(teamDescription: String) {
        self.teamDescription = teamDescription
    }
}
