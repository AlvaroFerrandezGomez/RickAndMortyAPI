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
            collectionView.topAnchor.constraint(equalTo: safeArea?.topAnchor ?? view.topAnchor, constant: Constants.paddingDistance),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.paddingDistance),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.paddingDistance),
            collectionView.bottomAnchor.constraint(equalTo: safeArea?.bottomAnchor ?? view.bottomAnchor, constant: Constants.paddingDistance),
        ])
    }

    func setupEmptyViewConstraints() {
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: collectionView.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
        ])
    }
}
