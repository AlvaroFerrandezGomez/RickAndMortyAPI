//
//  Characters+UseCase.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import Foundation

protocol CharactersUseCase {
    func execute(completion: @escaping (Result<CharactersEntity, RMError>) -> Void)
}

final class DefaultCharactersUseCase: CharactersUseCase {
    private var repository: CharactersRepository
    private var currentPage = 0
    private var charactersArray: [CharacterDetailEntity]? = []

    init(repository: CharactersRepository = DefaultCharactersRepository()) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<CharactersEntity, RMError>) -> Void) {
        currentPage += 1
        let completion: (Result<CharactersDecodable, RMError>) -> Void = { result in
            switch result {
            case .success(let decodable):
                var entity = CharactersEntity(decodable: decodable)
                let characters = entity.results ?? []
                self.charactersArray?.append(contentsOf: characters)
                entity.results = self.charactersArray
                completion(.success(entity))
            case .failure(let error):
                completion(.failure(error))
            }
        }

        let parameters = CharactersRepositoryParameters(pageNumber: currentPage)
        repository.fetchCharacters(params: parameters,
                                   completion: completion)
    }
}
