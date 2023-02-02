//
//  EpisodesView+Constraints.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import UIKit

extension EpisodesView {
    func setupTableViewConstraints() {
        let safeArea: UILayoutGuide? = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea?.topAnchor ?? view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.paddingDistance),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.paddingDistance),
            tableView.bottomAnchor.constraint(equalTo: safeArea?.bottomAnchor ?? view.bottomAnchor, constant: Constants.paddingDistance),
        ])
    }
}
