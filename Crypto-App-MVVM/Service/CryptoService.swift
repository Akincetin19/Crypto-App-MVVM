//
//  CryptoService.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 3.03.2023.
//

import Foundation


class CryptoService {
    
    
    func downloadAllAssets(completion: @escaping (Result<[Crypto]?, Error>)-> ()) {
        
        guard let url = URL(string: APIURLs.allAssets()) else {return}
        
        NetworkManager.shared.download(url: url) {[weak self] result in
            
            guard let self = self else {return}
            switch result {
            case.success(let data):
                completion(.success(self.handleWithData(data: data)))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
    func downloadCoinInfo(coinName: String, completion: @escaping (Result<Crypto?, Error>)-> ()){
        guard let url = URL(string: APIURLs.detailCrypto(name: coinName)) else {return}
        print(url)
        NetworkManager.shared.download(url: url) {[weak self] result in
            
            guard let self = self else {return}
            switch result {
            case.success(let data):
                completion(.success(self.handleWithData(data: data)))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
    private func handleWithData(data: Data) -> [Crypto]? {
        do {
            let cryptocurrencies = try JSONDecoder().decode(Cryptocurrencies.self, from: data)
            return cryptocurrencies.data
        } catch  {
            return nil
        }
    }
    private func handleWithData(data: Data) -> Crypto? {
        do {
            let crypto = try JSONDecoder().decode(Crypto.self, from: data)
            return crypto
        } catch {
            print(error)
            return nil
        }
    }
}
