//
//  Characters+Repository.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import Foundation

// MARK: CharactersRepository Protocol

protocol CharactersRepository {
    func fetchCharacters(params: CharactersRepositoryParameters, completion: @escaping (Result<CharactersDecodable, RMError>) -> Void)
}

// MARK: DefaultCharactersRepository Class

final class DefaultCharactersRepository: CharactersRepository {
    private let endPoint = "https://rickandmortyapi.com/api/character/?page="
    private weak var task: URLSessionTask?

    func fetchCharacters(params: CharactersRepositoryParameters, completion: @escaping (Result<CharactersDecodable, RMError>) -> Void) {
        task?.cancel()

        guard let url = URL(string: endPoint + String(describing: params.pageNumber)) else {
            let error: RMError = .serviceError(message: "Malformed URL for fetchCharacters in DefaultCharactersRepository")
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

// MARK: DefaultCharactersRepository Response Mannagement

extension DefaultCharactersRepository {
    func manageResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<CharactersDecodable, RMError>) -> Void) {
        if (response as? HTTPURLResponse)?.statusCode != 200, let error = error {
            let error: RMError = .serviceError(message: error.localizedDescription)
            completion(.failure(error))
        }

        guard let data = data else {
            let error: RMError = .serviceError(message: "No Data Received when fetching in CharactersRepository")
            completion(.failure(error))
            return
        }

        guard let decodable = try? JSONDecoder().decode(CharactersDecodable.self, from: data) else {
            completion(.failure(RMError.decodeError(forDecodable: "CharactersDecodable")))
            return
        }

        completion(.success(decodable))
    }
}
