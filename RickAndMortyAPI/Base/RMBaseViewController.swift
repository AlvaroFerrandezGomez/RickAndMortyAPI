//
//  RMBaseViewController.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import UIKit

// MARK: RMBaseViewController

class RMBaseViewController<T>: UIViewController {
    var mainCoordinator: T?
    let spinnerVC = RMSpinnerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let childCoordinator = mainCoordinator as? CharactersCoordinator {
            childCoordinator.parentCoordinator?.childDidFinish(childCoordinator)
        }
        
        if let childCoordinator = mainCoordinator as? EpisodesCoordinator {
            childCoordinator.parentCoordinator?.childDidFinish(childCoordinator)
        }
    }
}

// MARK: Spinner methods

extension RMBaseViewController {
    func showSpinner() {
        DispatchQueue.main.async {
            self.addChild(self.spinnerVC)
            self.spinnerVC.view.frame = self.view.frame
            self.view.addSubview(self.spinnerVC.view)
            self.spinnerVC.didMove(toParent: self)
        }
    }

    func hideSpinner() {
        DispatchQueue.main.async {
            self.spinnerVC.willMove(toParent: nil)
            self.spinnerVC.view.removeFromSuperview()
            self.spinnerVC.removeFromParent()
        }
    }
}
