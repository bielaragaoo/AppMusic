//
//  DetailViewController.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 23/03/23.
//

import UIKit

class DetailViewController: UIViewController {

    var viewInstance: DetailView?
    var cardModel: CardViewModel?

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
}

extension DetailViewController: UIScrollViewDelegate {

}

extension DetailViewController: DetailViewDelegate {
    func tapCloseButton() {
        self.dismiss(animated: true, completion: nil)

    }


}
