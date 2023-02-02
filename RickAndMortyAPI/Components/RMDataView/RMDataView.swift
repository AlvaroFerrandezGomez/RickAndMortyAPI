//
//  RMDataView.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import UIKit

final class RMDataView: UIView {
    private var model: RMDataViewModel?

    var titleTextLabel: UILabel = {
        let titleTextLabel = UILabel(frame: .zero)
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false

        return titleTextLabel
    }()

    var descriptionTextLabel: UILabel = {
        let descriptionTextLabel = UILabel(frame: .zero)
        descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false

        return descriptionTextLabel
    }()

    func configure(model: RMDataViewModel) {
        self.model = model
        setupView()
    }
}

// MARK: Setup View

extension RMDataView {
    private func setupView() {
        setupTitleTextLabel()
        setupDescriptionTextLabel()
    }

    private func setupTitleTextLabel() {
        addSubview(titleTextLabel)

        titleTextLabel.text = model?.titleText ?? ""
        titleTextLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        setupTitleTextLabelConstraints()
    }

    private func setupDescriptionTextLabel() {
        addSubview(descriptionTextLabel)

        descriptionTextLabel.text = model?.descriptionText ?? ""
        descriptionTextLabel.font = UIFont.italicSystemFont(ofSize: 14)

        setupDescriptionTextLabelConstraints()
    }
}
