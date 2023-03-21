//
//  HomeView.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 21/03/23.
//

import UIKit

class HomeView: UIView {

    private lazy var musicTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupConstraints() 
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        musicTableView.delegate = delegate
        musicTableView.dataSource = dataSource
    }

    func setupConstraints() {
        addSubview(musicTableView)

        NSLayoutConstraint.activate([
            musicTableView.topAnchor.constraint(equalTo: topAnchor),
            musicTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            musicTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            musicTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
