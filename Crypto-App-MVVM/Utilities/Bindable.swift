//
//  Bindable.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 4.03.2023.
//

import Foundation

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
