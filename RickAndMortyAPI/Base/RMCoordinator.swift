//
//  RMCoordinator.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

public protocol RMCoordinator {
    var childCoordinators: [RMCoordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
