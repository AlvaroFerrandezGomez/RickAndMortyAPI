//
//  CharactersView.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

// MARK: - CharactersView

class CharactersView: UIViewController {
    var viewModel: DefaultCharactersViewModel?

    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBinding()

        viewModel?.viewDidLoad()
    }

    // MARK: - Setup view method

    func setupView() {
        view.backgroundColor = .red

        setupConstraints()
    }

    // MARK: - Binding method

    func setupBinding() {}

    func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}
