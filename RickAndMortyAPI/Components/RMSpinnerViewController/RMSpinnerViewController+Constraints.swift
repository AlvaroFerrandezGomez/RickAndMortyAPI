//
//  RMSpinnerViewController+Constraints.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import UIKit

extension RMSpinnerViewController {
    func setupSpinnerViewConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
