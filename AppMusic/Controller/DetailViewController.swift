//
//  DetailViewController.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 23/03/23.
//

import UIKit

enum StateAnimation {
    case long
    case short
}

class DetailViewController: UIViewController {

    var viewInstance: DetailView?
    var cardModel: CardViewModel?
    var valueAnimation: StateAnimation = .long

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func loadView() {
        super.loadView()
        viewInstance = DetailView(dataView: cardModel)
        viewInstance?.configDelegates(tableViewDelegate: self, tableViewDataSource: self, scrollDelegate: self, detailViewDelegate: self)
        view = viewInstance
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardModel?.cardList?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        cell.setupCell(data: cardModel?.cardList?[indexPath.row] ?? CardListModel())
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewInstance?.playerView.setupPlayerView(data: cardModel?.cardList?[indexPath.row] ?? CardListModel())
        viewInstance?.playerViewBottomAnchor?.constant = 0
        animationWithView()
    }
}

extension DetailViewController: UIScrollViewDelegate {

    private func animationWithView() {
        UIView.animateKeyframes(withDuration: 0.3, delay: 0) {
            self.view.layoutIfNeeded()
        }
    }

    private func validateAnimation(actualState: StateAnimation, updateState: StateAnimation) {
        if valueAnimation == actualState {
            animationWithView()
        }
        valueAnimation = updateState
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene}).first?
            .windows.filter({$0.isKeyWindow}).first

        guard let topPadding = window?.safeAreaInsets.top else { return }

        if scrollView.contentOffset.y >= 300 {
            viewInstance?.navBarTopAnchor?.constant = 0

            validateAnimation(actualState: .long, updateState: .short)
        } else {
            viewInstance?.navBarTopAnchor?.constant = -((topPadding) + 80)

            validateAnimation(actualState: .short, updateState: .long)
        }
    }
}

extension DetailViewController: DetailViewDelegate {
    func tapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
