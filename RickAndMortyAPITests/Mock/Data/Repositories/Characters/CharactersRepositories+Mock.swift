//
//  CharactersRepositories+Mock.swift
//  RickAndMortyAPITests
//
//  Created by Álvaro Ferrández Gómez on 1/2/23.
//

@testable import RickAndMortyAPI
import XCTest

final class CharactersRepositoryRepositorySuccessMock: CharactersRepository {
    func fetchCharacters(params: CharactersRepositoryParameters, completion: @escaping (Result<CharactersDecodable, RMError>) -> Void) {
        let json = CharactersMock.makeJsonMock()
        guard let decodable = try? JSONDecoder().decode(CharactersDecodable.self, from: json) else { return }
        completion(.success(decodable))
    }
}

final class CharactersRepositoryRepositoryFailureMock: CharactersRepository {
    func fetchCharacters(params: CharactersRepositoryParameters, completion: @escaping (Result<CharactersDecodable, RMError>) -> Void) {
        let error = RMError.parseError(message: "Could not get the decodable for the service response")
        completion(.failure(error))
    }
}
