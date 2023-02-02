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
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -83),
        ])
    }

    func setupContentViewConstraints() {
//        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
//        heightConstraint.priority = UILayoutPriority(250)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            heightConstraint,
        ])
    }

    func setupCharacterImageViewConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 300),
            characterImageView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }

    func setupCharacterNameViewConstraints() {
        NSLayoutConstraint.activate([
            characterNameView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 8),
            characterNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            characterNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            characterNameView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

    func setupCharacterGenderViewConstraints() {
        NSLayoutConstraint.activate([
            characterGenderView.topAnchor.constraint(equalTo: characterNameView.bottomAnchor, constant: 8),
            characterGenderView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterGenderView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
            characterGenderView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

    func setupCharacterSpecieViewConstraints() {
        NSLayoutConstraint.activate([
            characterSpecieView.topAnchor.constraint(equalTo: characterGenderView.bottomAnchor, constant: 8),
            characterSpecieView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterSpecieView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
            characterSpecieView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

    func setupCharacterOriginViewConstraints() {
        NSLayoutConstraint.activate([
            characterOriginView.topAnchor.constraint(equalTo: characterSpecieView.bottomAnchor, constant: 8),
            characterOriginView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterOriginView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
            characterOriginView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

    func setupCharacterLocationViewConstraints() {
        NSLayoutConstraint.activate([
            characterLocationView.topAnchor.constraint(equalTo: characterOriginView.bottomAnchor, constant: 8),
            characterLocationView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterLocationView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
            characterLocationView.heightAnchor.constraint(equalToConstant: 60),
            characterLocationView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}
