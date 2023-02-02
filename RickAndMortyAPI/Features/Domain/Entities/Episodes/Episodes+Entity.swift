//
//  Episodes+Entity.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import Foundation

struct EpisodesEntity {
    var info: EpisodesInfoEntity?
    var results: [EpisodesResultEntity]?

    init(decodable: EpisodesDecodable) {
        if let decodableInfo = decodable.info {
            self.info = EpisodesInfoEntity(decodable: decodableInfo)
        }
        self.results = decodable.results?.map { EpisodesResultEntity(decodable: $0) }
    }
}

struct EpisodesInfoEntity {
    var count: Int?
    var pages: Int?
    var next: String?
    var previous: String?

    init(decodable: EpisodesInfoDecodable) {
        self.count = decodable.count
        self.pages = decodable.pages
        self.next = decodable.next
        self.previous = decodable.previous
    }
}

struct EpisodesResultEntity {
    var id: Int?
    var name: String?
    var airDate: String?
    var episode: String?
    var characters: [String]
    var url: String?
    var created: String?

    init(decodable: EpisodesResultDecodable) {
        self.id = decodable.id
        self.name = decodable.name
        self.airDate = decodable.airDate
        self.episode = decodable.episode
        self.characters = decodable.characters
        self.url = decodable.url
        self.created = decodable.created
    }
}
