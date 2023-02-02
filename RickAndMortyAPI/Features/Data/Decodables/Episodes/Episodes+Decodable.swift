//
//  Episodes+Decodable.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import Foundation

struct EpisodesDecodable: Codable {
    var info: EpisodesInfoDecodable?
    var results: [EpisodesResultDecodable]?
}

struct EpisodesInfoDecodable: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var previous: String?

    enum CodingKeys: String, CodingKey {
        case count, pages, next
        case previous = "prev"
    }
}

struct EpisodesResultDecodable: Codable {
    var id: Int?
    var name: String?
    var airDate: String?
    var episode: String?
    var characters: [String]
    var url: String?
    var created: String?

    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }
}
