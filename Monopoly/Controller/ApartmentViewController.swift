//
//  ApartmentViewController.swift
//  Monopoly
//
//  Created by Али  on 22.02.2023.
//

import UIKit
import SnapKit

class ApartmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var manager = GameManager()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.getCurrentPlayer().places.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellForListOfApartments
        cell.home.text = manager.getCurrentPlayer().places[indexPath.row]
//        print(manager.getCurrentPlayer().places[0])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        print("\(manager.getCurrentPlayer().places.count)")
        setupConstraints()
        table.delegate = self
        table.dataSource = self
        view.backgroundColor = .white
    }
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.register(TableViewCellForListOfApartments.self, forCellReuseIdentifier: "cell")
        return table
    }()
    

    
    func setupConstraints() {
        table.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
