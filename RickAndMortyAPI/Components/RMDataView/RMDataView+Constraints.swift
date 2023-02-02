//
//  RMDataView+Constraints.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import UIKit

extension RMDataView {
    func setupTitleTextLabelConstraints() {
        NSLayoutConstraint.activate([
            titleTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }

    func setupDescriptionTextLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionTextLabel.topAnchor.constraint(equalTo: titleTextLabel.topAnchor, constant: 16),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: titleTextLabel.leadingAnchor),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: titleTextLabel.trailingAnchor),
            descriptionTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
}
