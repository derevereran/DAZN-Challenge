//
//  NewsResponse.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation

struct NewsResponse: Codable {

    let news: [News]?

    private enum CodingKeys: String, CodingKey {
        case news = "news"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        news = try? values.decode([News].self, forKey: .news)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(news, forKey: .news)
    }

}

struct News: Codable {

    let id: Int?
    let title: String?
    let description: String?
    let date: String?
    let link: String?
    let picUrl: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case date = "date"
        case link = "link"
        case picUrl = "picUrl"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decode(Int.self, forKey: .id)
        title = try? values.decode(String.self, forKey: .title)
        description = try? values.decode(String.self, forKey: .description)
        date = try? values.decode(String.self, forKey: .date)
        link = try? values.decode(String.self, forKey: .link)
        picUrl = try? values.decode(String.self, forKey: .picUrl)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(date, forKey: .date)
        try container.encode(link, forKey: .link)
        try container.encode(picUrl, forKey: .picUrl)
    }

}
