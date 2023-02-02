//
//  Characters+Decodable.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import Foundation

struct CharactersDecodable: Codable {
    var info: CharactersInfoDecodable?
    var results: [CharacterDetailDecodable]?
}

struct CharactersInfoDecodable: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var previous: String?

    enum CodingKeys: String, CodingKey {
        case count, pages, next
        case previous = "prev"
    }
}

struct CharacterDetailDecodable: Codable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: CharacterDetailGenericDecodable?
    var location: CharacterDetailGenericDecodable?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

struct CharacterDetailGenericDecodable: Codable {
    var name: String?
    var url: String?
}
