//
//  RMError.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import Foundation

public enum RMError: Error {
    case serviceError(message: String)
    case decodeError(forDecodable: String)
    case parseError(message: String)
    case leakError
}

extension RMError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .serviceError(let message):
            return NSLocalizedString("[RMError - serviceError] \(message)", comment: "error")
        case .decodeError(let forDecodable):
            return NSLocalizedString("[RMError - decodeError] \(forDecodable)", comment: "error")
        case .parseError(let message):
            return NSLocalizedString("[RMError - parseError] \(message)", comment: "error")
        default:
            return NSLocalizedString("[RMError - unknown]", comment: "error")
        }
    }
}
