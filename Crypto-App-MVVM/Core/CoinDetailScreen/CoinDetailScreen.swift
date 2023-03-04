//
//  CoinDetailScreen.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 4.03.2023.
//

import UIKit

class CoinDetailScreen: UIViewController {

    var coin: Crypto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(coin?.name)

        
    }
}
