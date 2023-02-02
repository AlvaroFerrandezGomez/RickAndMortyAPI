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
            descriptionTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.paddingSize),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.paddingSize),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.paddingSize),
        ])
    }

    func setupLottieAnimationViewConstraints() {
        NSLayoutConstraint.activate([
            lottieAnimationView.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: Constants.lottieTopDistance),
            lottieAnimationView.centerXAnchor.constraint(equalTo: descriptionTextLabel.centerXAnchor),
            lottieAnimationView.heightAnchor.constraint(equalToConstant: Constants.animationSize),
            lottieAnimationView.widthAnchor.constraint(equalToConstant: Constants.animationSize),
        ])
    }
}
