//
//  CharactersView+DataSource.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

final class CharactersViewDatasource: NSObject, UICollectionViewDataSource {
    var collectionView: UICollectionView
    var viewModel: CharactersViewModel

    init(collectionView: UICollectionView,
         viewModel: CharactersViewModel)
    {
        self.collectionView = collectionView
        self.viewModel = viewModel
    }

    func registerCells() {
        collectionView.register(cellType: RMCharacterCell.self)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.model.value?.characters.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RMCharacterCell = collectionView.dequeueReusableCell(for: indexPath)
        let model = RMCharacterCellModel(urlImage: viewModel.model.value?.characters[indexPath.row].urlImage,
                                       name: viewModel.model.value?.characters[indexPath.row].name)

        cell.configure(model: model)
        return cell
    }
}
