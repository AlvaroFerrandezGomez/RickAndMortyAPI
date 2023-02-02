//
//  Characters+Entity.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import Foundation

struct CharactersEntity {
    var info: CharactersInfoEntity?
    var results: [CharacterDetailEntity]?

    init(decodable: CharactersDecodable) {
        if let decodableInfo = decodable.info {
            self.info = CharactersInfoEntity(decodable: decodableInfo)
        }
        self.results = decodable.results?.map { CharacterDetailEntity(decodable: $0) }
    }
}

struct CharactersInfoEntity {
    var count: Int?
    var pages: Int?
    var next: String?
    var previous: String?

    init(decodable: CharactersInfoDecodable) {
        self.count = decodable.count
        self.pages = decodable.pages
        self.next = decodable.next
        self.previous = decodable.previous
    }
}

struct CharacterDetailEntity {
    var id: Int?
    var name: String?
    var status: Bool?
    var species: String?
    var type: String?
    var gender: String?
    var origin: CharacterDetailGenericEntity?
    var location: CharacterDetailGenericEntity?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?

    init(decodable: CharacterDetailDecodable) {
        self.id = decodable.id
        self.name = decodable.name
        self.status = decodable.status == "Alive"
        self.species = decodable.species
        self.type = decodable.type
        self.gender = decodable.gender
        if let decodableOrigin = decodable.origin {
            self.origin = CharacterDetailGenericEntity(decodable: decodableOrigin)
        }
        if let decodableLocation = decodable.location {
            self.location = CharacterDetailGenericEntity(decodable: decodableLocation)
        }
        self.image = decodable.image
        self.episode = decodable.episode
        self.url = decodable.url
        self.created = decodable.created
    }
}

struct CharacterDetailGenericEntity {
    var name: String?
    var url: String?

    init(decodable: CharacterDetailGenericDecodable) {
        self.name = decodable.name
        self.url = decodable.url
    }
}
