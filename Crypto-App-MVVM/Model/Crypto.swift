//
//  Crypto.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 3.03.2023.
//

import Foundation


struct Cryptocurrencies: Decodable {
    
    let data: [Crypto]?
}
struct Crypto: Decodable {
    
    let id : String?
    let rank  : String?
    let symbol : String?
    let name : String?
    let supply : String?
    let maxSupply : String?
    let marketCapUsd : String?
    let volumeUsd24Hr : String?
    let priceUsd : String?
    let changePercent24Hr : String?
    let vwap24Hr : String?
    let explorer : String?

}
