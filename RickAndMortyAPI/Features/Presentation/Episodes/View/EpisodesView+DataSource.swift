//
//  EpisodesView+DataSource.swift
//  RickAndMortyAPI
//
//  Created by Álvaro Ferrández Gómez on 31/1/23.
//

import UIKit

final class EpisodesViewDatasource: NSObject, UITableViewDataSource {
    var tableView: UITableView
    var viewModel: EpisodesViewModel

    init(tableView: UITableView,
         viewModel: EpisodesViewModel)
    {
        self.tableView = tableView
        self.viewModel = viewModel
    }

    func registerCells() {
        tableView.register(cellType: RMEpisodeCell.self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.value?.episodes.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RMEpisodeCell = tableView.dequeueReusableCell(for: indexPath)
        let model = RMEpisodeCellModel(name: viewModel.model.value?.episodes[indexPath.row].name,
                                     episode: viewModel.model.value?.episodes[indexPath.row].episode)
        cell.configure(model: model)
        cell.selectionStyle = .none
        return cell
    }
}
