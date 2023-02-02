//
//  CharacterDetailViewModel.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 1/2/23.
//

import Foundation

protocol CharacterDetailViewModelInput {
    func viewDidLoad()
}

protocol CharacterDetailViewModelOutput {
    var model: Box<CharacterDetailModel?> { get }
}

typealias CharacterDetailViewModel = CharacterDetailViewModelInput & CharacterDetailViewModelOutput

final class DefaultCharacterDetailViewModel: CharacterDetailViewModel {
    var model: Box<CharacterDetailModel?> = Box(nil)

    init(model: CharacterDetailModel? = nil) {
        self.model.value = model
    }

    func viewDidLoad() {}
}
