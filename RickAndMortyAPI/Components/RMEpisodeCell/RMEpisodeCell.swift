//
//  RMEpisodeCell.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import UIKit

final class RMEpisodeCell: UITableViewCell, ReusableCell {
    private var model: RMEpisodeCellModel?
    
    var episodeNameViewLabel: UIView = {
        let episodeNameViewLabel = UIView(frame: .zero)
        episodeNameViewLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNameViewLabel.layer.masksToBounds = false
        episodeNameViewLabel.layer.shadowColor = Constants.shadowColor
        episodeNameViewLabel.layer.shadowOpacity = Constants.shadowOpacity
        episodeNameViewLabel.layer.shadowOffset = Constants.shadowOffset
        episodeNameViewLabel.layer.shadowRadius = Constants.shadowRadius
        episodeNameViewLabel.layer.cornerRadius = Constants.cornerRadius
        episodeNameViewLabel.layer.shadowPath = nil
        episodeNameViewLabel.backgroundColor = Constants.borderBackgroundColor
        episodeNameViewLabel.clipsToBounds = false
        
        return episodeNameViewLabel
    }()
    
    var episodeNameLabel: UILabel = {
        let episodeNameLabel = UILabel(frame: .zero)
        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return episodeNameLabel
    }()
    
    func configure(model: RMEpisodeCellModel) {
        self.model = model
        setupView()
    }
}

// MARK: Setup View

extension RMEpisodeCell {
    private func setupView() {
        setupEpisodeNameViewLabel()
        setupEpisodeNameLabel()
    }
    
    private func setupEpisodeNameViewLabel() {
        contentView.addSubview(episodeNameViewLabel)
    
        setupEpisodeNameViewLabelConstraint()
    }
        
    private func setupEpisodeNameLabel() {
        episodeNameViewLabel.addSubview(episodeNameLabel)
        
        episodeNameLabel.textColor = .black
        episodeNameLabel.textAlignment = .left
        
        if let name = model?.name, let episodeNumber = model?.episode {
            episodeNameLabel.text = episodeNumber + " - " + name
        }
        
        setupEpisodeNameLabelConstraint()
    }
}
