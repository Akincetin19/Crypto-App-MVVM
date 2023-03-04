//
//  TableViewHeader.swift
//  Crypto-App-MVVM
//
//  Created by Akın Çetin on 3.03.2023.
//

import UIKit


class TableHeader: UITableViewHeaderFooterView {
    static let identifier = "TableHeader"
    
    var label: UILabel = {
       
        let label = UILabel()
        label.text = "denemew"
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .left
        return label
        
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        label.frame = CGRect(x: 0, y: contentView.frame.size.height-10-label.frame.size.height, width: contentView.frame.size.width, height: label.frame.size.height)
    }
}

