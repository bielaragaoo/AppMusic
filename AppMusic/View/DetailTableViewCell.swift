//
//  DetailTableViewCell.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 28/03/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    static let identifier = "DetailTableViewCellIdentifier"

    private lazy var detailView = DetailCellView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(data: CardListModel) {
        detailView.setupCell(data: data)
    }

    private func setupViews() {
        contentView.addSubview(detailView)

        setupConstraints()
    }

    private func setupConstraints() {

        detailView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
