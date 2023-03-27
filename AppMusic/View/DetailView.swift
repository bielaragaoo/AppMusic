//
//  DetailView.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 23/03/23.
//

import UIKit

class DetailView: UIView {

    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?

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
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 15
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func closePressed() {

    }
    
}
