//
//  CoinCell.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 3.03.2023.
//

import UIKit

final class CoinCell: UITableViewCell {

    
    var coinSymbol = UIImageView()
    
    let coinNameLabel: UILabel = {
       
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
        
    }()
    let coinSymbolNameLabel: UILabel = {
       
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
        
    }()
    let coinPercentLabel: UILabel = {
       
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
        
    }()
    let coinPriceLabel: UILabel = {
       
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
        
    }()
    
    let coinImage = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(coinImage)
        addSubview(coinNameLabel)
        addSubview(coinSymbolNameLabel)
        addSubview(coinPercentLabel)
        addSubview(coinPriceLabel)
        coinImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 16, right: 0), size: .init(width: 64, height: 64))
        coinNameLabel.anchor(top: topAnchor, leading: coinImage.trailingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 16, left: 16, bottom: 0, right: 100))
        coinSymbolNameLabel.anchor(top: coinNameLabel.bottomAnchor, leading: coinNameLabel.leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 16, left: 0, bottom: 16, right: 0) ,size: .init(width: 100, height: 0))
        coinPercentLabel.translatesAutoresizingMaskIntoConstraints = false
        coinPercentLabel.centerYAnchor.constraint(equalTo: coinNameLabel.centerYAnchor).isActive = true
        coinPercentLabel.leadingAnchor.constraint(equalTo: coinNameLabel.trailingAnchor,constant: 0).isActive = true
        coinPercentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        coinPriceLabel.anchor(top: coinPercentLabel.bottomAnchor, leading: coinSymbolNameLabel.trailingAnchor, bottom: bottomAnchor, trailing: coinPercentLabel.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 16, right: 0))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
extension CoinCell {
    func configureCell(coin: Crypto) {
        
        
        var image = UIImage(named: coin.symbol?.lowercased() ?? "")
        if image == nil{
            image = UIImage(named: "temp")
        }
        self.coinImage.image = image
        self.coinImage.contentMode = .scaleAspectFit
        
        coinNameLabel.text = coin.name
        coinSymbolNameLabel.text = coin.symbol
        
        let changePercent = Double(coin.changePercent24Hr!)
        var doubleStr = String(format: "%.2f", changePercent!)
        
        if(changePercent! < 0){
            coinPercentLabel.textColor = UIColor.red
            let split = doubleStr.components(separatedBy: "-")
            doubleStr = "-%\(split[1])"
        }
        else {
            coinPercentLabel.textColor = UIColor.green
            doubleStr = "+%\(doubleStr)"
        }
        coinPercentLabel.text = doubleStr
        
        let coinPrice = Double(coin.priceUsd!)
        var doublePrice = String(format: "%.6f", coinPrice!)
        
        
        coinPriceLabel.text = "$\(doublePrice)"
    }
}
