//
//  EpisodesCoordinator.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import UIKit

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
        vc.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "film"), tag: 1)

        return navigationController
    }

    func showError(error: RMError) {
        let alertTitle = "An error has occurred"
        let alertDescription = String(describing: error.localizedDescription)
        let alertButtonText = "Accept"

        let alertController = UIAlertController(title: alertTitle, message: alertDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: alertButtonText, style: .default)
        alertController.addAction(action)
        navigationController.present(alertController, animated: true)
    }
}
