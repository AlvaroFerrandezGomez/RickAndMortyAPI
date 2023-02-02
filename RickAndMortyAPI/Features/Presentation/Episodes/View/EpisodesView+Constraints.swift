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
            tableView.topAnchor.constraint(equalTo: safeArea?.topAnchor ?? view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: safeArea?.bottomAnchor ?? view.bottomAnchor, constant: 16),
        ])
    }
}
