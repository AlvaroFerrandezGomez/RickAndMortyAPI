//
//  CharactersView+Delegate.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import UIKit

final class CharactersViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView
    var viewModel: CharactersViewModel

    init(collectionView: UICollectionView,
         viewModel: CharactersViewModel)
    {
        self.collectionView = collectionView
        self.viewModel = viewModel
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size: CGFloat = (self.collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let characterDetail = viewModel.model.value?.characters[indexPath.row] {
            viewModel.characterSelected(characterDetail: characterDetail)
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let numberOfCharacters = viewModel.model.value?.characters.count ?? 1
        if indexPath.row == numberOfCharacters - 1, !viewModel.searching {
            viewModel.fetchData()
        }
    }
}
