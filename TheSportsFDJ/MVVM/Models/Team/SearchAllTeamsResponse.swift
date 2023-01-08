//
//  SearchAllTeamsResponse.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation

// MARK: - SearchAllTeamsResponse
public struct SearchAllTeamsResponse: Codable, Equatable {
    let teams: [Team]?
}

// MARK: - Team
struct Team: Codable, Equatable {
    let idTeam, idSoccerXML, idAPIfootball: String?
    let intLoved: String?
    let strTeam, strTeamShort, strAlternate, intFormedYear: String?
    let strSport, strLeague, idLeague, strLeague2: String?
    let idLeague2, strLeague3, idLeague3, strLeague4: String?
    let idLeague4: String?
    let strLeague5: String?
    let idLeague5: String?
    let strLeague6: String?
    let idLeague6: String?
    let strLeague7: String?
    let idLeague7, strDivision: JSONNull?
    let strManager, strStadium, strKeywords: String?
    let strRSS: String?
    let strStadiumThumb: String?
    let strStadiumDescription, strStadiumLocation, intStadiumCapacity, strWebsite: String?
    let strFacebook, strTwitter, strInstagram, strDescriptionEN: String?
    let strDescriptionDE, strDescriptionFR: String?
    let strDescriptionCN: JSONNull?
    let strDescriptionIT: String?
    let strDescriptionJP, strDescriptionRU, strDescriptionES, strDescriptionPT: String?
    let strDescriptionSE, strDescriptionNL, strDescriptionHU: JSONNull?
    let strDescriptionNO: String?
    let strDescriptionIL, strDescriptionPL: JSONNull?
    let strKitColour1, strKitColour2: String?
    let strKitColour3: String?
    let strGender, strCountry: String?
    let strTeamBadge, strTeamJersey, strTeamLogo: String?
    let strTeamFanart1, strTeamFanart2, strTeamFanart3, strTeamFanart4: String?
    let strTeamBanner: String?
    let strYoutube, strLocked: String?
}

