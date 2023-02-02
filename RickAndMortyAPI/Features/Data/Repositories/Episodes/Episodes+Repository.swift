//
//  Episodes+Repository.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import Foundation

// MARK: EpisodesRepository Protocol

protocol EpisodesRepository {
    func fetchEpisodes(params: EpisodesRepositoryParameters, completion: @escaping (Result<EpisodesDecodable, RMError>) -> Void)
}

// MARK: DefaultEpisodesRepository Class

final class DefaultEpisodesRepository: EpisodesRepository {
    private let endPoint = "https://rickandmortyapi.com/api/episode/?page="
    private weak var task: URLSessionTask?

    func fetchEpisodes(params: EpisodesRepositoryParameters, completion: @escaping (Result<EpisodesDecodable, RMError>) -> Void) {
        task?.cancel()

        guard let url = URL(string: endPoint + String(describing: params.pageNumber)) else {
            let error: RMError = .serviceError(message: "Malformed URL for fetchEpisodes in EpisodesRepository")
            completion(.failure(error))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            self.manageResponse(data: data, response: response, error: error, completion: completion)
        })

        task?.resume()
    }
}

// MARK: DefaultEpisodesRepository Response Mannagement

extension DefaultEpisodesRepository {
    func manageResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<EpisodesDecodable, RMError>) -> Void) {
        if (response as? HTTPURLResponse)?.statusCode != 200, let error = error {
            let error: RMError = .serviceError(message: error.localizedDescription)
            completion(.failure(error))
        }

        guard let data = data else {
            let error: RMError = .serviceError(message: "No Data Received when fetching in EpisodesRepository")
            completion(.failure(error))
            return
        }

        guard let decodable = try? JSONDecoder().decode(EpisodesDecodable.self, from: data) else {
            completion(.failure(RMError.decodeError(forDecodable: "EpisodesDecodable")))
            return
        }

        completion(.success(decodable))
    }
}
