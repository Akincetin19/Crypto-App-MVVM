//
//  HomeScreenViewModel.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 3.03.2023.
//

import Foundation

protocol HomeScreenViewModelProtocol {
    var view: HomeScreenViewControllerProtocol? { get set }
    func viewDidLoad()
    func getCoins()
    var selectedCoin: Bindable<Crypto> {get set}
    
}
final class HomeScreenViewModel {
    
    weak var view: HomeScreenViewControllerProtocol?
    var selectedCoin = Bindable<Crypto>()
    private let service = CryptoService()
    var coins: [Crypto] = []
    var coinSymbols: [String] = []
}
extension HomeScreenViewModel: HomeScreenViewModelProtocol {
    
    func getCoins() {
        service.downloadAllAssets {[weak self] result in
            guard let self = self else {return}
            switch result {
            case.failure(let error):
                self.handleWithError(error: error)
            case.success(let data):
                self.handleWithData(data: data)
            }
        }
    }
    func viewDidLoad() {
        view?.configureTableView()
        self.getCoins()
        didSelectItem()
    }
}
extension HomeScreenViewModel {
    private func handleWithData(data: [Crypto]?) {
        guard let data = data else {return}
        self.coins.append(contentsOf: data)
        getSymbols()
        self.view?.reloadTableView()
    }
    private func handleWithError(error: Error) {
        print(error.localizedDescription)
    }
    private func getSymbols() {
        coinSymbols = coins.map({ $0.symbol!.lowercased()})
    }
    func didSelectItem() {
        selectedCoin.bind {[weak self] crypto in
            
            guard let self = self else {return}
            guard let name = crypto?.name else {return}
            self.service.downloadCoinInfo(coinName: name) { result in
                switch result {
                case.failure(let error):
                    print(error.localizedDescription)
                case.success(let data):
                    print(data?.symbol)
                }
            }
        }
    }
}
