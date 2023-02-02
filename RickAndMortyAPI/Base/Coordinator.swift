//
//  RMCoordinator.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
}

protocol ChildCoordinator: Coordinator {
    var parentCoordinator: MainCoordinator? { get set }
    var navigationController: UINavigationController { get set }
}
