//
//  EpisodesViewModel.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 26/1/23.
//

import Foundation

protocol EpisodesViewModelInput {
    func viewDidLoad()
    func fetchData()
}

protocol EpisodesViewModelOutput {
    var model: Box<EpisodesModel?> { get }
    var loadingStatus: Box<RMLoadingStatus?> { get }
    var error: Box<RMError?> { get }
    var moreData: Bool { get }
}

typealias EpisodesViewModel = EpisodesViewModelInput & EpisodesViewModelOutput

final class DefaultEpisodesViewModel: EpisodesViewModel {
    var model: Box<EpisodesModel?> = Box(nil)
    var loadingStatus: Box<RMLoadingStatus?> = Box(nil)
    var error: Box<RMError?> = Box(nil)
    var moreData: Bool = true
    
    var fetchEpisodesUseCase: EpisodesUseCase = DefaultEpisodesUseCase()
    
    init(fetchEpisodesUseCase: EpisodesUseCase = DefaultEpisodesUseCase()) {
        self.fetchEpisodesUseCase = fetchEpisodesUseCase
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        if moreData {
            loadingStatus.value = .start
            
            fetchEpisodesUseCase.execute { [weak self] result in
                guard let self = self else {
                    self?.error.value = RMError.leakError
                    return
                }
                
                switch result {
                case let .success(entity):
                    self.loadingStatus.value = .stop
                    
                    self.moreData = !(entity.info?.next == nil)
                    
                    var episodesAuxiliar: [EpisodeModel] = []
                    let episodes = entity.results ?? []
                    
                    for episode in episodes {
                        episodesAuxiliar.append(EpisodeModel(name: episode.name,
                                                             airDate: episode.airDate,
                                                             episode: episode.episode))
                    }
                    
                    self.model.value = EpisodesModel(episodes: episodesAuxiliar)
                case let .failure(error):
                    self.loadingStatus.value = .stop
                    self.error.value = error
                }
            }
        }
    }
}
