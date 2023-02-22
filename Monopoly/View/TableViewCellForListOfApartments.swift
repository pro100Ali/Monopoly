//
//  TableViewCellForListOfApartments.swift
//  Monopoly
//
//  Created by Али  on 22.02.2023.
//

import UIKit
import SnapKit

class TableViewCellForListOfApartments: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(home)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var home: UILabel = {
        let label = UILabel()
        label.text = "100$"
        return label
    }()
    
    func setupConstraints() {
        home.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
