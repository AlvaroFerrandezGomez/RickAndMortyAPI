//
//  RMEpisodeCell.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import UIKit

extension RMEpisodeCell {
    private enum Constants {
        static let textAlignmentDate = NSTextAlignment.left
        static let textAlignmentDescription = NSTextAlignment.left
        static let contentModeImage = ContentMode.scaleAspectFill
        static let cornerRadius = 6.0
        static let shadowOpacity = Float(0.2)
        static let shadowOffset = CGSize(width: 1, height: 4)
        static let shadowRadius = CGFloat(5.0)
    }
        
    private enum Colours {
        static let shadowColor = UIColor.black.cgColor
        static let borderBackgroundColor = UIColor.white
    }
}

final class RMEpisodeCell: UITableViewCell, ReusableCell {
    private var model: RMEpisodeCellModel?
    
    var episodeNameViewLabel: UIView = {
        let episodeNameViewLabel = UIView(frame: .zero)
        episodeNameViewLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNameViewLabel.layer.masksToBounds = false
        episodeNameViewLabel.layer.shadowColor = Colours.shadowColor
        episodeNameViewLabel.layer.shadowOpacity = Constants.shadowOpacity
        episodeNameViewLabel.layer.shadowOffset = Constants.shadowOffset
        episodeNameViewLabel.layer.shadowRadius = Constants.shadowRadius
        episodeNameViewLabel.layer.cornerRadius = Constants.cornerRadius
        episodeNameViewLabel.layer.shadowPath = nil
        episodeNameViewLabel.backgroundColor = Colours.borderBackgroundColor
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
