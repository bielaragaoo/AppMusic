//
//  CustomNavBar.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 30/03/23.
//

import UIKit

class CustomNavBar: UIView {

    private lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    private lazy var musicTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    private lazy var likeAndTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    private lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()

    private lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.6
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupNavBar(data: CardViewModel) {
        musicTitleLabel.text = data.cardTitle
        categoryTitleLabel.text = data.categoryName
        cardImage.image = UIImage(named: data.cardImage ?? " ")
        likeAndTimeLabel.attributedText = .featureText(data.likeCount ?? " ", data.duration ?? " ")
    }

    private func setupviews() {
        addSubview(cardImage)
        addSubview(overlayView)
        addSubview(categoryTitleLabel)
        addSubview(musicTitleLabel)
        addSubview(likeAndTimeLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: topAnchor),
            cardImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            overlayView.topAnchor.constraint(equalTo: cardImage.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: cardImage.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: cardImage.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: cardImage.bottomAnchor),

            categoryTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            categoryTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            categoryTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            musicTitleLabel.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant: 5),
            musicTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            musicTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            likeAndTimeLabel.topAnchor.constraint(equalTo: musicTitleLabel.bottomAnchor, constant: 5),
            likeAndTimeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            likeAndTimeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }

}
