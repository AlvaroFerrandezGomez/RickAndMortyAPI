//
//  CharacterDetailViewModel.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 1/2/23.
//

import Foundation

protocol CharacterDetailViewModelInput {}

protocol CharacterDetailViewModelOutput {}

typealias CharacterDetailViewModel = CharacterDetailViewModelInput & CharacterDetailViewModelOutput

final class DefaultCharacterDetailViewModel: CharacterDetailViewModel {
    init() {}
}
