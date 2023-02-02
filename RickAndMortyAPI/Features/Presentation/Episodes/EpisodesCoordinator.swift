//
//  EpisodesCoordinator.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import UIKit

extension EpisodesCoordinator {
    enum Constants {
        static let episodesTitle = "Episodes"
        static let episodesImage = "film"
        static let errorTitle = "An error has occurred"
        static let errorButton = "Accept"
    }
}

class EpisodesCoordinator: ChildCoordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showEpisodesView() -> UINavigationController {
        let vc = EpisodesView()
        navigationController.setViewControllers([vc], animated: true)

        vc.episodesCoordinator = self
        vc.tabBarItem = UITabBarItem(title: Constants.episodesTitle, image: UIImage(systemName: Constants.episodesImage), tag: 1)

        return navigationController
    }

    func showError(error: RMError) {
        let alertTitle = Constants.errorTitle
        let alertDescription = String(describing: error.localizedDescription)
        let alertButtonText = Constants.errorButton

        let alertController = UIAlertController(title: alertTitle, message: alertDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: alertButtonText, style: .default)
        alertController.addAction(action)
        navigationController.present(alertController, animated: true)
    }
}
