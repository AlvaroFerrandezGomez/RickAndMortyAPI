//
//  CharactersView.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

// MARK: - CharactersView

final class CharactersView: RMBaseViewController {
    weak var coordinator: MainCoordinator?

    var viewModel = DefaultCharactersViewModel()

    private(set) var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    private lazy var collectionViewDataSource: CharactersViewDatasource = {
        let datasource = CharactersViewDatasource(collectionView: collectionView,
                                                  viewModel: viewModel)
        datasource.registerCells()
        return datasource
    }()

    private lazy var collectionViewDelegate: CharactersViewDelegate = {
        let delegate = CharactersViewDelegate(collectionView: collectionView,
                                              viewModel: viewModel)
        return delegate
    }()

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

    private func setupNavigationTitle() {
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Characters"
    }

    private func setupView() {
        view.backgroundColor = .white

        setupCollectionView()
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)

        collectionView.backgroundColor = .clear
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.showsVerticalScrollIndicator = false

        setupCollectionViewConstraints()
    }

    // MARK: - Binding method

    func setupBinding() {
        viewModel.loadingStatus.bind { [weak self] status in
            guard let self = self,
                  let status = status else { return }

            switch status {
            case .start:
                self.showSpinner()
            case .stop:
                self.hideSpinner()
            }
        }

        viewModel.error.bind { [weak self] error in
            guard let self = self,
                  let error = error else { return }

            self.coordinator?.showError(error: error)
        }

        viewModel.model.bind { [weak self] model in
            guard let self = self,
                  let _ = model else { return }

            self.reloadView()
        }

        viewModel.characterSelected.bind { [weak self] characterSelected in
            guard let self = self,
                  let characterSelected = characterSelected else { return }

            self.coordinator?.showCharacterDetail(characterSelected: characterSelected)
        }
    }

    private func reloadView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
