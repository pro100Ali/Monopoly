//
//  TableViewCell.swift
//  Monopoly
//
//  Created by Али  on 21.02.2023.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameOfPlayer)
        contentView.addSubview(balance)
        contentView.addSubview(position)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy  var nameOfPlayer: UILabel = {
        let label = UILabel()
        label.text = "hello"
        return label
    }()
    
    lazy  var balance: UILabel = {
        let label = UILabel()
        label.text = "100$"
        return label
    }()
    
    lazy  var position: UILabel = {
        let label = UILabel()
        label.text = "Al farabi"
        return label
    }()
    
    func setupConstraints() {
        nameOfPlayer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        balance.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.top.equalTo(nameOfPlayer.snp.top).offset(15)
        }
        position.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(130)
            make.top.equalTo(nameOfPlayer.snp.top).offset(15)
        }

    }
}
