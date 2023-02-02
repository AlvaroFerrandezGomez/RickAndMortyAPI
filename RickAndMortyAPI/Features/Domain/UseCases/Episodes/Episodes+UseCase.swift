//
//  Episodes+UseCase.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import Foundation

protocol EpisodesUseCase {
    func execute(completion: @escaping (Result<EpisodesEntity, RMError>) -> Void)
}

final class DefaultEpisodesUseCase: EpisodesUseCase {
    private var repository: EpisodesRepository
    private var currentPage = 0
    private var episodesArray: [EpisodesResultEntity]? = []

    init(repository: EpisodesRepository = DefaultEpisodesRepository()) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<EpisodesEntity, RMError>) -> Void) {
        currentPage += 1
        let completion: (Result<EpisodesDecodable, RMError>) -> Void = { result in
            switch result {
            case .success(let decodable):
                var entity = EpisodesEntity(decodable: decodable)
                let episodes = entity.results ?? []
                self.episodesArray?.append(contentsOf: episodes)
                entity.results = self.episodesArray
                completion(.success(entity))
            case .failure(let error):
                completion(.failure(error))
            }
        }

        let parameters = EpisodesRepositoryParameters(pageNumber: currentPage)
        repository.fetchEpisodes(params: parameters,
                                 completion: completion)
    }
}
