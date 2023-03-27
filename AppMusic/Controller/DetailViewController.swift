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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }


}

extension DetailViewController: UIScrollViewDelegate {

}

extension DetailViewController: DetailViewDelegate {
    func tapCloseButton() {
        self.dismiss(animated: true, completion: nil)

    }


}
