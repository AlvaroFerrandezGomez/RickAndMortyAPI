//
//  EpisodesView+Delegate.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import UIKit

final class EpisodesViewDelegate: NSObject, UITableViewDelegate {
    var tableView: UITableView
    var viewModel: EpisodesViewModel

    init(tableView: UITableView,
         viewModel: EpisodesViewModel)
    {
        self.tableView = tableView
        self.viewModel = viewModel
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let numberOfEpisodes = viewModel.model.value?.episodes.count ?? 1
        if indexPath.row == numberOfEpisodes - 1 {
            viewModel.fetchData()
        }
    }
}
