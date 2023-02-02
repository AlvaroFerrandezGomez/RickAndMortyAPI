//
//  CharactersView.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

// MARK: - CharactersView

final class CharactersView: RMBaseViewController, UISearchControllerDelegate, UISearchResultsUpdating {
    weak var coordinator: MainCoordinator?

    var viewModel = DefaultCharactersViewModel()

    private(set) var searchController: UISearchController = {
        let searchController = UISearchController()

        return searchController
    }()

    private(set) var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    private(set) var emptyView: RMEmptyView = {
        let emptyView = RMEmptyView(frame: .zero)
        emptyView.translatesAutoresizingMaskIntoConstraints = false

        return emptyView
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

        setupSearchBar()
        setupCollectionView()
        setupEmptyView()
    }

    private func setupSearchBar() {
        navigationItem.searchController = searchController

        searchController.delegate = self

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search a character"
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)

        collectionView.backgroundColor = .clear
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.showsVerticalScrollIndicator = false

        setupCollectionViewConstraints()
    }

    private func setupEmptyView() {
        view.addSubview(emptyView)

        emptyView.isHidden = true
        emptyView.configure()

        setupEmptyViewConstraints()
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
                  let model = model else { return }
            if !model.characters.isEmpty {
                self.reloadView()
            } else {
                self.showEmptyView()
            }
        }

        viewModel.characterSelected.bind { [weak self] characterSelected in
            guard let self = self,
                  let characterSelected = characterSelected else { return }

            self.coordinator?.showCharacterDetail(characterSelected: characterSelected)
        }
    }

    private func reloadView() {
        DispatchQueue.main.async {
            self.emptyView.isHidden = true
            self.collectionView.isHidden = false
            self.collectionView.reloadData()
        }
    }

    private func showEmptyView() {
        DispatchQueue.main.async {
            self.emptyView.isHidden = false
            self.collectionView.isHidden = true
        }
    }
}

extension CharactersView {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text != "", text.count > 2 {
            viewModel.searchCharacter(searchText: text)
        } else {
            viewModel.resetSearch()
        }
    }
}
