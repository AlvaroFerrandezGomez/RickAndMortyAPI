//
//  CharactersView+Constraints.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

extension CharactersView {
    func setupCollectionViewConstraints() {
        let safeArea: UILayoutGuide? = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea?.topAnchor ?? view.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: safeArea?.bottomAnchor ?? view.bottomAnchor, constant: 16),
        ])
    }
}
