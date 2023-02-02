//
//  CharactersViewModel.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import Foundation

protocol CharactersViewModelInput {
    func viewDidLoad()
    func fetchData()
    func searchCharacter(searchText: String)
    func resetSearch()
    func characterSelected(characterDetail: CharacterDetailModel)
}

protocol CharactersViewModelOutput {
    var model: Box<CharactersModel?> { get }
    var unfilteredCharacters: [CharacterDetailModel] { get }
    var loadingStatus: Box<RMLoadingStatus?> { get }
    var error: Box<RMError?> { get }
    var characterSelected: Box<CharacterDetailModel?> { get }
    var moreData: Bool { get }
    var searching: Bool { get }
}

typealias CharactersViewModel = CharactersViewModelInput & CharactersViewModelOutput

final class DefaultCharactersViewModel: CharactersViewModel {
    var model: Box<CharactersModel?> = Box(nil)
    var unfilteredCharacters: [CharacterDetailModel] = []
    var loadingStatus: Box<RMLoadingStatus?> = Box(nil)
    var error: Box<RMError?> = Box(nil)
    var characterSelected: Box<CharacterDetailModel?> = Box(nil)
    var moreData: Bool = true
    var searching: Bool = false

    var fetchCharactersUseCase: CharactersUseCase = DefaultCharactersUseCase()

    init(fetchCharactersUseCase: CharactersUseCase = DefaultCharactersUseCase()) {
        self.fetchCharactersUseCase = fetchCharactersUseCase
    }

    func viewDidLoad() {
        fetchData()
    }

    func fetchData() {
        if moreData {
            loadingStatus.value = .start

            fetchCharactersUseCase.execute { [weak self] result in
                guard let self = self else {
                    self?.error.value = RMError.leakError
                    return
                }
                switch result {
                case let .success(entity):
                    self.loadingStatus.value = .stop

                    self.moreData = !(entity.info?.next == nil)

                    var charactersAuxiliar: [CharacterDetailModel] = []
                    let characters = entity.results ?? []

                    for character in characters {
                        charactersAuxiliar.append(CharacterDetailModel(urlImage: character.image ?? "",
                                                                       name: character.name ?? "",
                                                                       status: character.status ?? false,
                                                                       species: character.species ?? "",
                                                                       gender: character.gender ?? "",
                                                                       origin: character.origin?.name ?? "",
                                                                       location: character.location?.name ?? ""))
                    }

                    self.unfilteredCharacters = charactersAuxiliar
                    self.model.value = CharactersModel(characters: charactersAuxiliar)
                case let .failure(error):
                    self.loadingStatus.value = .stop
                    self.error.value = error
                }
            }
        }
    }

    func searchCharacter(searchText: String) {
        searching = true

        let charactersAuxiliar = unfilteredCharacters.filter { charactersAuxiliar in
            guard let name = charactersAuxiliar.name else { return false }
            return name.lowercased().contains(searchText.lowercased())
        }

        model.value = CharactersModel(characters: charactersAuxiliar)
    }

    func characterSelected(characterDetail: CharacterDetailModel) {
        characterSelected.value = characterDetail
    }
    
    func resetSearch() {
        model.value = CharactersModel(characters: unfilteredCharacters)
    }
}
