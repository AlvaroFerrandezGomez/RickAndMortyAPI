//
//  MainTabBarViewController.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 26/1/23.
//

import UIKit

final class MainTabBarViewController: UITabBarController {
    weak var coordinator: MainCoordinator?

    init(coordinator: MainCoordinator?) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    final func setupViews() {
        guard let coordinator = coordinator else { return }

        let charactersNavController = UINavigationController()
        let charactersCoordinator = CharactersCoordinator(navigationController: charactersNavController)
        charactersCoordinator.parentCoordinator = coordinator

        let episodesNavController = UINavigationController()
        let episodesCoordinator = EpisodesCoordinator(navigationController: episodesNavController)
        episodesCoordinator.parentCoordinator = coordinator

        let finalCharactersNavController = charactersCoordinator.showCharactersView()
        let finalEpisodesNavController = episodesCoordinator.showEpisodesView()

        setViewControllers([finalCharactersNavController,
                            finalEpisodesNavController],
                           animated: true)
    }
}
