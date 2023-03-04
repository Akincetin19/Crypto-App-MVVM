//
//  ViewController.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 28.02.2023.
//

import UIKit


protocol HomeScreenViewControllerProtocol: AnyObject {
    
    func configureTableView()
    func reloadTableView()
 
}

class ViewController: UIViewController {
    
    let tableView = UITableView()
    private let viewModel = HomeScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CoinCell else{return UITableViewCell()}
        cell.configureCell(coin: viewModel.coins[indexPath.item])
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeader") as? TableHeader
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedCoin.value = viewModel.coins[indexPath.item]
    }
}
extension ViewController: HomeScreenViewControllerProtocol {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoinCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "TableHeader")
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
