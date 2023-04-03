//
//  CustomPlayerView.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 03/04/23.
//

import UIKit
import MarqueeLabel

class CustomPlayerView: UIView {

    var videoTimer: Timer?
    var time: CGFloat = 0.0

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "list4")
        view.widthAnchor.constraint(equalToConstant: 90).isActive = true
        return view
    }()

    private lazy var musicLabel: MarqueeLabel = {
        let label = MarqueeLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome da música que aparece no scroll horizontal"
        label.font = UIFont(name: "Avenir-Heavy", size: 18)
        label.textColor = .white.withAlphaComponent(0.8)
        label.type = .continuous
        label.fadeLength = 10
        label.leadingBuffer = 30
        label.trailingBuffer = 30
        return label
    }()

    private lazy var pauseButton: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .white
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return view
    }()

    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.progressTintColor = .yellow.withAlphaComponent(0.8)
        view.progress = 0.0
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(imageView)
        addSubview(musicLabel)
        addSubview(pauseButton)
        addSubview(progressView)

        videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(changeProgressView), userInfo: nil, repeats: true)

        setupConstraints()
    }

    @objc func changeProgressView() {
        time += 0.001
        progressView.progress = Float(time/120)

        if time >= 120 {
            videoTimer?.invalidate()
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            musicLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            musicLabel.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor, constant: -10),
            musicLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            pauseButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            pauseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            progressView.topAnchor.constraint(equalTo: topAnchor),
            progressView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

    }

}
