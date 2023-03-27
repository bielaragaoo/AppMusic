//
//  DetailView.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 23/03/23.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    func tapCloseButton()
}

class DetailView: UIView {

    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?

    weak var delegate: DetailViewDelegate?

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.autoresizingMask = .flexibleHeight
        scroll.bounces = false
        scroll.clipsToBounds = true
        return scroll
    }()

    private lazy var cardView: CardView = {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.updateLayout(mode: .full)
        view.cardContainerView.layer.cornerRadius = 0
        view.setupCardView(data: cardModel ?? CardViewModel())
        return view
    }()

    private lazy var cardTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return tableView
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 15
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        return button
    }()

    init(dataView: CardViewModel?) {
        super.init(frame: CGRect())
        cardModel = dataView

        DispatchQueue.main.async {
            self.setupViews()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func closePressed() {
        delegate?.tapCloseButton()
    }

    func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(cardView)
        scrollView.addSubview(cardTableView)
        scrollView.addSubview(closeButton)

        setupConstraints()
    }

    func configDelegates(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, scrollDelegate: UIScrollViewDelegate, detailViewDelegate: DetailViewDelegate) {
        cardTableView.delegate = tableViewDelegate
        cardTableView.dataSource = tableViewDataSource
        scrollView.delegate = scrollDelegate
        self.delegate = detailViewDelegate
    }

    func setupConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene}).first?
            .windows.filter({$0.isKeyWindow}).first

        guard let topPadding = window?.safeAreaInsets.top else { return }

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(topPadding)),
            cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 500),

            cardTableView.topAnchor.constraint(equalTo: cardView.bottomAnchor),
            cardTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cardTableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cardTableView.heightAnchor.constraint(equalToConstant: CGFloat(80 * (cardModel?.cardList?.count ?? 0) + 20)),
            cardTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),


        ])
    }
    
}
