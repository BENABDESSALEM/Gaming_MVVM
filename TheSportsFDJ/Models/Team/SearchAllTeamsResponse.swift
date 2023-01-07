//
//  SearchAllTeamsResponse.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation

// MARK: - SearchAllTeamsResponse
public struct SearchAllTeamsResponse: Codable {
    let teams: [Team]?
}

// MARK: - Team
struct Team: Codable {
    let idTeam, idSoccerXML, idAPIfootball: String?
    let intLoved: String?
    let strTeam: String?
    let strTeamShort: JSONNull?
    let strAlternate, intFormedYear, strSport, strLeague: String?
    let idLeague, strLeague2, idLeague2, strLeague3: String?
    let idLeague3: String?
    let strLeague4: String?
    let idLeague4: String?
    let strLeague5: String?
    let idLeague5: JSONNull?
    let strLeague6: String?
    let idLeague6: JSONNull?
    let strLeague7: String?
    let idLeague7, strDivision: JSONNull?
    let strManager, strStadium, strKeywords: String?
    let strRSS: String?
    let strStadiumThumb: String?
    let strStadiumDescription, strStadiumLocation, intStadiumCapacity, strWebsite: String?
    let strFacebook, strTwitter, strInstagram, strDescriptionEN: String?
    let strDescriptionDE: JSONNull?
    let strDescriptionFR: String?
    let strDescriptionCN: JSONNull?
    let strDescriptionIT: String?
    let strDescriptionJP, strDescriptionRU: JSONNull?
    let strDescriptionES: String?
    let strDescriptionPT, strDescriptionSE, strDescriptionNL, strDescriptionHU: JSONNull?
    let strDescriptionNO, strDescriptionIL, strDescriptionPL: JSONNull?
    let strKitColour1, strKitColour2, strKitColour3: String?
    let strGender, strCountry: String?
    let strTeamBadge, strTeamJersey: String?
    let strTeamLogo: String?
    let strTeamFanart1, strTeamFanart2, strTeamFanart3, strTeamFanart4: String?
    let strTeamBanner: String?
    let strYoutube, strLocked: String?
}

