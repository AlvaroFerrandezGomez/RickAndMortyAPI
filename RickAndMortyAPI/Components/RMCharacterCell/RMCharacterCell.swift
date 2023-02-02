//
//  RMCharacterCell.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 25/1/23.
//

import Kingfisher
import UIKit

final class RMCharacterCell: UICollectionViewCell, ReusableCell {
    private var model: RMCharacterCellModel?
    
    var characterImageView: UIImageView = {
        let characterImageView = UIImageView(frame: .zero)
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return characterImageView
    }()
    
    var characterNameView: UIView = {
        let characterNameView = UIView(frame: .zero)
        characterNameView.translatesAutoresizingMaskIntoConstraints = false
        
        return characterNameView
    }()
    
    var characterNameLabel: UILabel = {
        let characterNameLabel = UILabel(frame: .zero)
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return characterNameLabel
    }()
    
    func configure(model: RMCharacterCellModel) {
        self.model = model
        setupView()
    }
}

// MARK: Setup View

extension RMCharacterCell {
    private func setupView() {
        setupCharacterImageView()
        setupCharacterNameView()
        setupCharacterNameLabel()
    }
    
    private func setupCharacterImageView() {
        contentView.addSubview(characterImageView)
        
        characterImageView.clipsToBounds = true
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.layer.cornerRadius = Constants.radius
        characterImageView.layer.borderColor = Constants.borderColor
        characterImageView.layer.borderWidth = Constants.borderWidth
        
        if let urlImage = model?.urlImage, let url = URL(string: urlImage) {
            characterImageView.kf.setImage(with: url)
        }
        
        setupCharacterImageViewConstraints()
    }
    
    private func setupCharacterNameView() {
        characterImageView.addSubview(characterNameView)
        
        characterNameView.clipsToBounds = true
        characterNameView.backgroundColor = .black
        
        setupCharacterNameViewConstraint()
    }
    
    private func setupCharacterNameLabel() {
        characterNameView.addSubview(characterNameLabel)
        
        characterNameLabel.textColor = .white
        characterNameLabel.textAlignment = .center
        
        if let name = model?.name {
            characterNameLabel.text = name
        }
        
        setupCharacterNameLabelConstraint()
    }
}
