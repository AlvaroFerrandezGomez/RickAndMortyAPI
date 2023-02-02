//
//  MainCoordinator.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

class MainCoordinator: RMCoordinator {
    var childCoordinators = [RMCoordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainTabBarViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }

    func showCharacterDetail(characterSelected: CharacterDetailModel) {
        let vc = CharacterDetailView(model: characterSelected)
        navigationController.pushViewController(vc, animated: true)
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
