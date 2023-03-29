//
//  DetailCellView.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 28/03/23.
//

import UIKit

class DetailCellView: UIView {


    private lazy var thumbImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "demo")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Music Title"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Music Subtitle"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        return label
    }()

    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        return button
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .lightGray
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(thumbImage)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(favoriteButton)
        addSubview(moreButton)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            thumbImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            thumbImage.centerYAnchor.constraint(equalTo: centerYAnchor),

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            titleLabel.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: 15),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 17),
            subtitleLabel.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -15),

            favoriteButton.leadingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: 20),
            favoriteButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            moreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }




}
