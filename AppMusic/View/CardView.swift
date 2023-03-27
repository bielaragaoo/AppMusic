//
//  CardView.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 21/03/23.
//

import UIKit

enum CardModeView {
    case full
    case card
}

class CardView: UIView {

    var mode: CardModeView?
    var dataModel: CardViewModel?

    var containerTopConstraint: NSLayoutConstraint?
    var containerLeadingConstraint: NSLayoutConstraint?
    var containerTrailingConstraint: NSLayoutConstraint?
    var containerBottomConstraint: NSLayoutConstraint?


    lazy var cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 20
        view.clipsToBounds = true
        return view
    }()

    private lazy var cardBackgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        return imageView
    }()

    private lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.6
        return view
    }()


    private lazy var profileBorderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 30
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()

    private lazy var profileImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        button.layer.cornerRadius = 10
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return button
    }()

    private lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    private lazy var dateCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    private lazy var musicTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
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

    private lazy var descriptionMusicLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()

    private lazy var actionsView: CardActionView = {
        let view = CardActionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCardView(data: CardViewModel) {
        categoryTitleLabel.text = data.categoryName
        dateCategoryLabel.text = data.categoryDate
        musicTitleLabel.text = data.cardTitle
        likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        descriptionMusicLabel.text = data.cardDescription
        cardBackgroundImage.image = UIImage(named: data.cardImage ?? "")
        profileImageView.image = UIImage(named: data.categoryImage ?? "")
    }

    private func setupSubviews() {
        addSubview(cardContainerView)
        cardContainerView.addSubview(cardBackgroundImage)
        cardContainerView.addSubview(overlayView)

        cardContainerView.addSubview(profileBorderView)
        cardContainerView.addSubview(profileImageView)
        cardContainerView.addSubview(profileImageButton)

        cardContainerView.addSubview(categoryTitleLabel)
        cardContainerView.addSubview(dateCategoryLabel)
        cardContainerView.addSubview(musicTitleLabel)
        cardContainerView.addSubview(likeAndTimeLabel)
        cardContainerView.addSubview(descriptionMusicLabel)
        cardContainerView.addSubview(actionsView)

        updateLayout(mode: mode ?? .card)

        setupCardView(data: dataModel ?? CardViewModel())
        setupConstraints()
    }

    func updateLayout(mode: CardModeView) {
        if mode == .full {
            containerTopConstraint?.constant = 0
            containerLeadingConstraint?.constant = 0
            containerTrailingConstraint?.constant = 0
            containerBottomConstraint?.constant = 0
            descriptionMusicLabel.isHidden = false
        } else {
            containerTopConstraint?.constant = 20
            containerLeadingConstraint?.constant = 15
            containerTrailingConstraint?.constant = -15
            containerBottomConstraint?.constant = -20
            descriptionMusicLabel.isHidden = true
        }
        actionsView.updateStackLayout(mode: mode)
    }

    private func setupConstraints() {
        containerTopConstraint = cardContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        containerLeadingConstraint = cardContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        containerTrailingConstraint = cardContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        containerBottomConstraint = cardContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)

        containerTopConstraint?.isActive = true
        containerLeadingConstraint?.isActive = true
        containerTrailingConstraint?.isActive = true
        containerBottomConstraint?.isActive = true

        NSLayoutConstraint.activate([
            cardContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cardContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            cardContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),

            overlayView.topAnchor.constraint(equalTo: cardContainerView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: cardContainerView.bottomAnchor),

            cardBackgroundImage.topAnchor.constraint(equalTo: cardContainerView.topAnchor),
            cardBackgroundImage.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor),
            cardBackgroundImage.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor),
            cardBackgroundImage.bottomAnchor.constraint(equalTo: cardContainerView.bottomAnchor),

            profileBorderView.topAnchor.constraint(equalTo: cardContainerView.topAnchor, constant: 60),
            profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),

            profileImageView.centerXAnchor.constraint(equalTo: profileBorderView.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: profileBorderView.centerYAnchor),

            profileImageButton.bottomAnchor.constraint(equalTo: profileBorderView.bottomAnchor),
            profileImageButton.trailingAnchor.constraint(equalTo: profileBorderView.trailingAnchor, constant: 4),

            categoryTitleLabel.topAnchor.constraint(equalTo: profileBorderView.bottomAnchor, constant: 10),
            categoryTitleLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),

            dateCategoryLabel.topAnchor.constraint(equalTo: categoryTitleLabel.bottomAnchor, constant: 2),
            dateCategoryLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),

            musicTitleLabel.topAnchor.constraint(equalTo: dateCategoryLabel.bottomAnchor, constant: 20),
            musicTitleLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            musicTitleLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),

            likeAndTimeLabel.topAnchor.constraint(equalTo: musicTitleLabel.bottomAnchor, constant: 10),
            likeAndTimeLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),

            descriptionMusicLabel.topAnchor.constraint(equalTo: likeAndTimeLabel.bottomAnchor, constant: 30),
            descriptionMusicLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            descriptionMusicLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),

            actionsView.bottomAnchor.constraint(equalTo: cardContainerView.bottomAnchor, constant: -20),
            actionsView.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            actionsView.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),
        ])
    }
}
