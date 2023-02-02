//
//  CharacterDetailView+Constraints.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import UIKit

extension CharacterDetailView {
    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.bottomHeight),
        ])
    }

    func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }

    func setupCharacterImageViewConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.genericPadding),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
            characterImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize),
        ])
    }

    func setupCharacterNameViewConstraints() {
        NSLayoutConstraint.activate([
            characterNameView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: Constants.genericPadding),
            characterNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.genericPadding),
            characterNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.genericPadding),
            characterNameView.heightAnchor.constraint(equalToConstant: Constants.genericSize),
        ])
    }

    func setupCharacterGenderViewConstraints() {
        NSLayoutConstraint.activate([
            characterGenderView.topAnchor.constraint(equalTo: characterNameView.bottomAnchor, constant: Constants.genericPadding),
            characterGenderView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterGenderView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
            characterGenderView.heightAnchor.constraint(equalToConstant: Constants.genericSize),
        ])
    }

    func setupCharacterSpecieViewConstraints() {
        NSLayoutConstraint.activate([
            characterSpecieView.topAnchor.constraint(equalTo: characterGenderView.bottomAnchor, constant: Constants.genericPadding),
            characterSpecieView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterSpecieView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
            characterSpecieView.heightAnchor.constraint(equalToConstant: Constants.genericSize),
        ])
    }

    func setupCharacterOriginViewConstraints() {
        NSLayoutConstraint.activate([
            characterOriginView.topAnchor.constraint(equalTo: characterSpecieView.bottomAnchor, constant: Constants.genericPadding),
            characterOriginView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterOriginView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
            characterOriginView.heightAnchor.constraint(equalToConstant: Constants.genericSize),
        ])
    }

    func setupCharacterLocationViewConstraints() {
        NSLayoutConstraint.activate([
            characterLocationView.topAnchor.constraint(equalTo: characterOriginView.bottomAnchor, constant: Constants.genericPadding),
            characterLocationView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterLocationView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
            characterLocationView.heightAnchor.constraint(equalToConstant: Constants.genericSize),
            characterLocationView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}
