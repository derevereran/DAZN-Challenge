//
//  MatchesResponse.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation

struct MatchesResponse: Codable {

    let name: String?
    let format: String?
    let date: String?
    let matches: [Matches]?
    let displayRound: Bool?

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case format = "format"
        case date = "date"
        case matches = "matches"
        case displayRound = "displayRound"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try? values.decode(String.self, forKey: .name)
        format = try? values.decode(String.self, forKey: .format)
        date = try? values.decode(String.self, forKey: .date)
        matches = try? values.decode([Matches].self, forKey: .matches)
        displayRound = try? values.decode(Bool.self, forKey: .displayRound)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(format, forKey: .format)
        try container.encode(date, forKey: .date)
        try container.encode(matches, forKey: .matches)
        try container.encode(displayRound, forKey: .displayRound)
    }

}

struct Matches: Codable {

    let id: Int?
    let dateTimeUtc: String
    let matchTime: String
    let status: String
    let ftsA: Int
    let ftsB: Int
    let htsA: Int
    let htsB: Int
    let teamA: TeamA
    let teamB: TeamB
    let extras: Extras

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case dateTimeUtc = "date_time_utc"
        case matchTime = "match_time"
        case status = "status"
        case ftsA = "fts_A"
        case ftsB = "fts_B"
        case htsA = "hts_A"
        case htsB = "hts_B"
        case teamA = "team_A"
        case teamB = "team_B"
        case extras = "extras"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        dateTimeUtc = try values.decode(String.self, forKey: .dateTimeUtc)
        matchTime = try values.decode(String.self, forKey: .matchTime)
        status = try values.decode(String.self, forKey: .status)
        ftsA = try values.decode(Int.self, forKey: .ftsA)
        ftsB = try values.decode(Int.self, forKey: .ftsB)
        htsA = try values.decode(Int.self, forKey: .htsA)
        htsB = try values.decode(Int.self, forKey: .htsB)
        teamA = try values.decode(TeamA.self, forKey: .teamA)
        teamB = try values.decode(TeamB.self, forKey: .teamB)
        extras = try values.decode(Extras.self, forKey: .extras)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(dateTimeUtc, forKey: .dateTimeUtc)
        try container.encode(matchTime, forKey: .matchTime)
        try container.encode(status, forKey: .status)
        try container.encode(ftsA, forKey: .ftsA)
        try container.encode(ftsB, forKey: .ftsB)
        try container.encode(htsA, forKey: .htsA)
        try container.encode(htsB, forKey: .htsB)
        try container.encode(teamA, forKey: .teamA)
        try container.encode(teamB, forKey: .teamB)
        try container.encode(extras, forKey: .extras)
    }

}
struct TeamA: Codable {

    let id: Int
    let uuid: String
    let name: String
    let tlaName: String
    let displayName: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case uuid = "uuid"
        case name = "name"
        case tlaName = "tla_name"
        case displayName = "display_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        uuid = try values.decode(String.self, forKey: .uuid)
        name = try values.decode(String.self, forKey: .name)
        tlaName = try values.decode(String.self, forKey: .tlaName)
        displayName = try values.decode(String.self, forKey: .displayName)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(name, forKey: .name)
        try container.encode(tlaName, forKey: .tlaName)
        try container.encode(displayName, forKey: .displayName)
    }

}

struct TeamB: Codable {

    let id: Int
    let uuid: String
    let name: String
    let tlaName: String
    let displayName: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case uuid = "uuid"
        case name = "name"
        case tlaName = "tla_name"
        case displayName = "display_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        uuid = try values.decode(String.self, forKey: .uuid)
        name = try values.decode(String.self, forKey: .name)
        tlaName = try values.decode(String.self, forKey: .tlaName)
        displayName = try values.decode(String.self, forKey: .displayName)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(name, forKey: .name)
        try container.encode(tlaName, forKey: .tlaName)
        try container.encode(displayName, forKey: .displayName)
    }

}


struct Extras: Codable {

    let iddaaCode: Int
    let iddaaLive: Bool

    private enum CodingKeys: String, CodingKey {
        case iddaaCode = "iddaa_code"
        case iddaaLive = "iddaa_live"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iddaaCode = try values.decode(Int.self, forKey: .iddaaCode)
        iddaaLive = try values.decode(Bool.self, forKey: .iddaaLive)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(iddaaCode, forKey: .iddaaCode)
        try container.encode(iddaaLive, forKey: .iddaaLive)
    }

}
