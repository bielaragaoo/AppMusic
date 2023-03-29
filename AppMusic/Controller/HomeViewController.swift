//
//  ViewController.swift
//  AppMusic
//
//  Created by Gabriel Aragao on 21/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    var viewInstance: HomeView?

    override func loadView() {
        viewInstance = HomeView()
        viewInstance?.setupTableViewProtocols(delegate: self, dataSource: self)
        view = viewInstance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell()}
        cell.setupCell(data: CardData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.cardModel = CardData[indexPath.row]
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }


}

