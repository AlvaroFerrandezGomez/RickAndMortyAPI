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

    let charactersVC: CharactersView = {
        let charactersVC = CharactersView()
        charactersVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.3.sequence"), tag: 0)

        return charactersVC
    }()

    let episodesVC: EpisodesView = {
        let episodesVC = EpisodesView()
        episodesVC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "film"), tag: 1)

        return episodesVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    final func setupView() {
        charactersVC.coordinator = coordinator
        episodesVC.coordinator = coordinator

        if let characterCoordinator = charactersVC.coordinator {
            coordinator?.childCoordinators.append(characterCoordinator)
        }
        
        if let episodesCoordinator = episodesVC.coordinator {
            coordinator?.childCoordinators.append(episodesCoordinator)
        }

        setViewControllers([UINavigationController(rootViewController: charactersVC),
                            UINavigationController(rootViewController: episodesVC)],
                           animated: true)
    }
}
