//
//  RMEmptyView.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 2/2/23.
//

import Lottie
import UIKit

final class RMEmptyView: UIView {
    var descriptionTextLabel: UILabel = {
        let descriptionTextLabel = UILabel(frame: .zero)
        descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false

        return descriptionTextLabel
    }()

    var lottieAnimationView: LottieAnimationView = {
        let lottieAnimationView = LottieAnimationView(frame: .zero)
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.isUserInteractionEnabled = false

        return lottieAnimationView
    }()

    func configure() {
        setupView()
    }
}

// MARK: Setup View

extension RMEmptyView {
    private func setupView() {
        setupDescriptionTextLabel()
        setupLottieAnimationView()
    }

    private func setupLottieAnimationView() {
        addSubview(lottieAnimationView)

        if let path = Bundle.main.path(forResource: "EmptyMorty", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let animation: LottieAnimation = try JSONDecoder().decode(LottieAnimation.self, from: data)
                lottieAnimationView.animation = animation
                lottieAnimationView.backgroundBehavior = .pauseAndRestore
            } catch {
                assertionFailure("Could not read Lottie json file")
            }
        }

        lottieAnimationView.play()
        lottieAnimationView.loopMode = .loop

        setupLottieAnimationViewConstraints()
    }

    private func setupDescriptionTextLabel() {
        addSubview(descriptionTextLabel)

        descriptionTextLabel.text = "An error has occurred."
        descriptionTextLabel.textAlignment = .center

        setupDescriptionTextLabelConstraints()
    }
}
