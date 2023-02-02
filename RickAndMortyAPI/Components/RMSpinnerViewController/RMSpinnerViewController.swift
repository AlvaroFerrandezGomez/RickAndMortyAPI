//
//  RMSpinnerViewController.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import UIKit

// MARK: RMSpinnerViewController

final class RMSpinnerViewController: UIViewController {
    private(set) var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .white
        spinner.startAnimating()
        
        return spinner
    }()

    override func loadView() {
        setupView()
    }
}

// MARK: Setup View

extension RMSpinnerViewController {
    private func setupView() {
        setupBackgroundView()
        setupSpinnerView()
    }

    private func setupBackgroundView() {
        view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.4
    }

    private func setupSpinnerView() {
        view.addSubview(spinner)
        setupSpinnerViewConstraints()
    }
}
