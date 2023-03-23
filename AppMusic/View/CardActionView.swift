//
//  CardActionView.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 22/03/23.
//

import UIKit

class CardActionView: UIView {

    private lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dislikeView, playView, likeView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    private lazy var downloadView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dislikeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var playView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var likeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var moreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()

    private lazy var dislikeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()

    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 35
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        return button
    }()

    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateStackLayout(mode: CardModeView) {
        if mode == .full {
            downloadView.isHidden = false
            moreView.isHidden = false

            buttonsStackView.addArrangedSubview(downloadView)
            buttonsStackView.addArrangedSubview(dislikeView)
            buttonsStackView.addArrangedSubview(playView)
            buttonsStackView.addArrangedSubview(likeView)
            buttonsStackView.addArrangedSubview(moreView)
        } else {
            downloadView.isHidden = true
            moreView.isHidden = true

            buttonsStackView.removeArrangedSubview(downloadView)
            buttonsStackView.removeArrangedSubview(moreView)
        }
    }

    private func setupViews() {
        addSubview(buttonsStackView)

        downloadView.addSubview(downloadButton)
        dislikeView.addSubview(dislikeButton)
        playView.addSubview(playButton)
        likeView.addSubview(likeButton)
        moreView.addSubview(moreButton)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            downloadButton.centerXAnchor.constraint(equalTo: downloadView.centerXAnchor),
            downloadButton.centerYAnchor.constraint(equalTo: downloadView.centerYAnchor),

            dislikeButton.centerXAnchor.constraint(equalTo: dislikeView.centerXAnchor),
            dislikeButton.centerYAnchor.constraint(equalTo: dislikeView.centerYAnchor),

            playButton.centerXAnchor.constraint(equalTo: playView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: playView.centerYAnchor),

            likeButton.centerXAnchor.constraint(equalTo: likeView.centerXAnchor),
            likeButton.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),

            moreButton.centerXAnchor.constraint(equalTo: moreView.centerXAnchor),
            moreButton.centerYAnchor.constraint(equalTo: moreView.centerYAnchor),
        ])
    }

}
