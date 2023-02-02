//
//  CharactersCoordinator.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import UIKit

class CharactersCoordinator: ChildCoordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showCharactersView() -> UINavigationController {
        let vc = CharactersView()
        navigationController.setViewControllers([vc], animated: true)

        vc.charactersCoordinator = self
        vc.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.3.sequence"), tag: 0)

        return navigationController
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
