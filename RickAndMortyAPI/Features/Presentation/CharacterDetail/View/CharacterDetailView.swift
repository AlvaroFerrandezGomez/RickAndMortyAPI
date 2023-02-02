//
//  CharacterDetailView.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 1/2/23.
//

import Kingfisher
import UIKit

// MARK: - CharacterDetailView

final class CharacterDetailView: RMBaseViewController {
    var viewModel: DefaultCharacterDetailViewModel
    var model: CharacterDetailModel

    private(set) var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private(set) var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private(set) var characterImageView: UIImageView = {
        let characterImageView = UIImageView(frame: .zero)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false

        return characterImageView
    }()

    private(set) var characterNameView: RMDataView = {
        let characterNameView = RMDataView(frame: .zero)
        characterNameView.translatesAutoresizingMaskIntoConstraints = false

        return characterNameView
    }()

    private(set) var characterGenderView: RMDataView = {
        let characterGenderView = RMDataView(frame: .zero)
        characterGenderView.translatesAutoresizingMaskIntoConstraints = false

        return characterGenderView
    }()

    private(set) var characterSpecieView: RMDataView = {
        let characterSpecieView = RMDataView(frame: .zero)
        characterSpecieView.translatesAutoresizingMaskIntoConstraints = false

        return characterSpecieView
    }()

    private(set) var characterOriginView: RMDataView = {
        let characterOriginView = RMDataView(frame: .zero)
        characterOriginView.translatesAutoresizingMaskIntoConstraints = false

        return characterOriginView
    }()

    private(set) var characterLocationView: RMDataView = {
        let characterLocationView = RMDataView(frame: .zero)
        characterLocationView.translatesAutoresizingMaskIntoConstraints = false

        return characterLocationView
    }()

    init(viewModel: CharacterDetailViewModel = DefaultCharacterDetailViewModel(),
         model: CharacterDetailModel)
    {
        self.model = model
        self.viewModel = DefaultCharacterDetailViewModel(model: model)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBinding()

        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationTitle()
    }

    // MARK: - Setup view method

    private func setupView() {
        view.backgroundColor = .white

        setupScrollView()
        setupStackView()

        setupCharacterImageView()
        setupCharacterNameView()
        setupCharacterGenderView()
        setupCharacterSpecieView()
        setupCharacterOriginView()
        setupCharacterLocationView()
    }

    // MARK: - Setup view method

    private func setupNavigationTitle() {
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = model.name ?? ""
    }

    // MARK: - Binding method

    func setupBinding() {
        viewModel.model.bind { [weak self] model in
            guard let self = self,
                  let _ = model else { return }

            self.reloadView()
        }
    }

    private func reloadView() {}

    private func setupScrollView() {
        view.addSubview(scrollView)

        setupScrollViewConstraints()
    }

    private func setupStackView() {
        scrollView.addSubview(stackView)
    }

    private func setupCharacterImageView() {
        stackView.addSubview(characterImageView)

        characterImageView.clipsToBounds = true
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.layer.cornerRadius = 150.0
        characterImageView.layer.borderColor = UIColor.white.cgColor
        characterImageView.layer.borderWidth = CGFloat(3)

        if let urlImage = model.urlImage, let url = URL(string: urlImage) {
            characterImageView.kf.setImage(with: url)
        }

        setupCharacterImageViewConstraints()
    }

    private func setupCharacterNameView() {
        stackView.addSubview(characterNameView)

        let model = RMDataViewModel(titleText: "Name",
                                    descriptionText: self.model.name ?? "")
        characterLocationView.configure(model: model)

        setupCharacterNameViewConstraints()
    }

    private func setupCharacterGenderView() {
        stackView.addSubview(characterGenderView)

        let model = RMDataViewModel(titleText: "Gender",
                                    descriptionText: self.model.gender ?? "")
        characterLocationView.configure(model: model)

        setupCharacterGenderViewConstraints()
    }

    private func setupCharacterSpecieView() {
        stackView.addSubview(characterSpecieView)

        let model = RMDataViewModel(titleText: "Specie",
                                    descriptionText: self.model.species ?? "")
        characterLocationView.configure(model: model)

        setupCharacterSpecieViewConstraints()
    }

    private func setupCharacterOriginView() {
        stackView.addSubview(characterOriginView)

        let model = RMDataViewModel(titleText: "Origin",
                                    descriptionText: self.model.origin ?? "")
        characterLocationView.configure(model: model)

        setupCharacterOriginViewConstraints()
    }

    private func setupCharacterLocationView() {
        stackView.addSubview(characterLocationView)

        let model = RMDataViewModel(titleText: "Location",
                                    descriptionText: self.model.location ?? "")
        characterLocationView.configure(model: model)

        setupCharacterLocationViewConstraints()
    }
}
