//
//  APIUrls.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 3.03.2023.
//

import Foundation

enum APIURLs {
    static func allAssets() -> String {
        "https://api.coincap.io/v2/assets"
    }
    static func detailCrypto(name: String) -> String {
        "https://api.coincap.io/v2/assets/\(name)"
    }
}

