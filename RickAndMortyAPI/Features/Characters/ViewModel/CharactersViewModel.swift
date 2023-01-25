//
//  CharactersViewModel.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import Foundation

protocol CharactersViewModelInput {
    func viewDidLoad()
}

protocol CharactersViewModelOutput {
    var model: CharactersModel? { get set }
}

typealias CharactersViewModel = CharactersViewModelInput & CharactersViewModelOutput

final class DefaultCharactersViewModel: CharactersViewModel {
    var model: CharactersModel?

    func viewDidLoad() {}
}
