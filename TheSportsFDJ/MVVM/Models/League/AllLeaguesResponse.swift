//
//  AllLeaguesResponse.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation

// MARK: - AllLeaguesResponse
public struct AllLeaguesResponse: Codable {
    let leagues: [League]?
}

// MARK: - League
struct League: Codable {
    let idLeague, strLeague, strSport: String?
    let strLeagueAlternate: String?
}
