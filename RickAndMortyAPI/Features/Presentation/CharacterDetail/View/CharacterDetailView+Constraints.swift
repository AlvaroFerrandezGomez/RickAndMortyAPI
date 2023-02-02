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
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }

    func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
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
            characterNameView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: -16),
            characterNameView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            characterNameView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
        ])
    }

    func setupCharacterGenderViewConstraints() {
        NSLayoutConstraint.activate([
            characterGenderView.topAnchor.constraint(equalTo: characterNameView.bottomAnchor, constant: 8),
            characterGenderView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterGenderView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
        ])
    }

    func setupCharacterSpecieViewConstraints() {
        NSLayoutConstraint.activate([
            characterSpecieView.topAnchor.constraint(equalTo: characterGenderView.bottomAnchor, constant: 8),
            characterSpecieView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterSpecieView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
        ])
    }

    func setupCharacterOriginViewConstraints() {
        NSLayoutConstraint.activate([
            characterOriginView.topAnchor.constraint(equalTo: characterSpecieView.bottomAnchor, constant: 8),
            characterOriginView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterOriginView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
        ])
    }

    func setupCharacterLocationViewConstraints() {
        NSLayoutConstraint.activate([
            characterLocationView.topAnchor.constraint(equalTo: characterOriginView.bottomAnchor, constant: 8),
            characterLocationView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor),
            characterLocationView.trailingAnchor.constraint(equalTo: characterNameView.trailingAnchor),
        ])
    }
}
