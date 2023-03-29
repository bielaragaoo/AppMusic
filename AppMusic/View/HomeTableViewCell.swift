//
//  HomeTableViewCell.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 21/03/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCellIdentifier"

    private lazy var cardView: CardView = {
        let card = CardView(mode: .card)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.clipsToBounds = true
        return card
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(data: CardViewModel) {
        cardView.setupCardView(data: data)
    }

    private func setupView() {
        contentView.addSubview(cardView)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}
