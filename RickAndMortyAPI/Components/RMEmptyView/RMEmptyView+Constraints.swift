//
//  RMEmptyView+Constraints.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import UIKit

extension RMEmptyView {
    func setupDescriptionTextLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    func setupLottieAnimationViewConstraints() {
        NSLayoutConstraint.activate([
            lottieAnimationView.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: -16),
            lottieAnimationView.leadingAnchor.constraint(equalTo: descriptionTextLabel.leadingAnchor),
            lottieAnimationView.trailingAnchor.constraint(equalTo: descriptionTextLabel.trailingAnchor),
            lottieAnimationView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
