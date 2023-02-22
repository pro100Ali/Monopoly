//
//  ViewControllerTable.swift
//  Monopoly
//
//  Created by Али  on 21.02.2023.
//

import UIKit
import SnapKit

class ViewControllerTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let gameManager = GameManager()
    var arrayOfPurchase: [String] = []
    var count = 1
    var space: Space = Space(id: 1, name: "bir zher", location: 9, cost: 122)
    var id2 = -1
    var total = 0
    var isFirstTap = true
    var temp = 0
    var start = false
    var firstRoll = true
//    var isPlayerOnesTurn: Bool = true

    let images = [
        UIImage(named: "dice1"),
        UIImage(named: "dice2"),
        UIImage(named: "dice3"),
        UIImage(named: "dice4"),
        UIImage(named: "dice5"),
        UIImage(named: "dice6")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameManager.players.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameOfPlayer.text =  gameManager.players[indexPath.row].name
        cell.balance.text = "\(String(gameManager.players[indexPath.row].balance))M"
        cell.position.text = Space.spaces[(gameManager.players[indexPath.row].currentPosition)].name
        temp = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == id2  {
                return indexPath
            }
        return nil

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = ApartmentViewController()
        newViewController.manager = gameManager
        present(newViewController, animated: true)
    }
    
    @objc func buyHouse() {
        if start {
            let currentPlayer = gameManager.getCurrentPlayer()
    //        print(currentPlayer.currentPosition)
            
            gameManager.getCurrentPlayer().updatePlayer(step: total)
            
            if gameManager.getCurrentPlayer().balance >= Space.spaces[gameManager.getCurrentPlayer().currentPosition].cost {
                print(" current player is \(gameManager.getCurrentPlayer().id-1)")

                if firstRoll {
                    print(gameManager.getCurrentPlayer().balance)
                    firstRoll = false
                } else {
                    print(gameManager.getCurrentPlayer().balance)
                    gameManager.getCurrentPlayer().balance -= Space.spaces[(gameManager.getCurrentPlayer().currentPosition)].cost
                }
                
                print(Space.spaces[(gameManager.getCurrentPlayer().currentPosition)].cost)
                
                currentPlayer.places.append(Space.spaces[(gameManager.players[temp].currentPosition)].name)
                
                print(currentPlayer.places)

                Player.space.append(Space.spaces[gameManager.getCurrentPlayer().currentPosition])

                minusMoney.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in
                    self.minusMoney.text = String("-\(Space.spaces[gameManager.getCurrentPlayer().currentPosition].cost)$")
                    self.minusMoney.isHidden = true
                }
         
            } else {
                let alertController = UIAlertController(title: "Wroooong", message: "Akshan zhook", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                }
                alertController.addAction(okAction)
                present(alertController, animated: true)
                print("\(gameManager.getCurrentPlayer().name) does not have enough money to buy a house on \(space.name)")
            }
           
        }
        
    }
    
    
    @objc func rollDice() {
        start = true
        let diceRoll1 = Int.random(in: 1...6)
        let diceRoll2 = Int.random(in: 1...6)
        let totalRoll = diceRoll1 + diceRoll2
        total = totalRoll
        let currentPlayer = gameManager.getCurrentPlayer()
        print(currentPlayer.currentPosition)
//        print("\(totalRoll) the totalRoll")
        gameManager.getCurrentPlayer().updatePlayer(step: totalRoll)
        print("position of it is \(Space.spaces[gameManager.getCurrentPlayer().currentPosition].name)")
        if let space = Space.spaces.first(where: { $0.location == totalRoll }) {
            imageOfCubiks.image = images[diceRoll1-1]
            imageOfCubiks2.image = images[diceRoll2-1]
            count += totalRoll
            
            nameOfThePlace.text = "\(gameManager.getCurrentPlayer().name) is \(Space.spaces[gameManager.getCurrentPlayer().currentPosition].name) is \(gameManager.getCurrentPlayer().currentPosition)"
            costOfThePlace.text = "\(String(Space.spaces[gameManager.getCurrentPlayer().currentPosition].cost))$"
            print(Space.spaces[currentPlayer.currentPosition].cost
)
//            id2 = space.location
//            DispatchQueue.main.async {
//            }
//            whichTurn.text = S
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            updateTurn()
            gameManager.endTurn()

          
        }
    }
    func updateTurn() {
        if(id2>=gameManager.players.count-1) {
            id2 = 0
            
        } else {
            id2 += 1
        }
//        print("id2 = \(id2)")
//        whichTurn.text = gameManager.players[id2].name
    }
    
    var buttonForBuy: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitle("Buy", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buyHouse), for: .touchUpInside)
        return button
    }()
    
    var buttonForSkip: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitle("Skip", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var nameOfThePlace: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Go"
        return label
    }()
    
    var costOfThePlace: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "100$"
        return label
    }()
    
    var minusMoney: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "-100$"
        label.isHidden = true
        label.textColor = .red
        return label
    }()
    
    
    var whichTurn: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Turn of Player1"
        label.textColor = .red
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(nameOfThePlace)
        view.addSubview(costOfThePlace)
        view.addSubview(imageOfCubiks)
        view.addSubview(imageOfCubiks2)
        view.addSubview(buttonForBuy)
        
        view.addSubview(buttonForRollingTheDice)
        view.addSubview(buttonForSkip)
        view.addSubview(minusMoney)
        view.backgroundColor = .white
        view.addSubview(whichTurn)
        setupConstraints()
    }
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    lazy private var imageOfCubiks: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "dice1.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy private var imageOfCubiks2: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "dice2.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var buttonForRollingTheDice: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitle("Roll it", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(rollDice), for: .touchUpInside)
        return button
    }()
    
    var mapImage: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "heatmap.png")
       return image
    }()
    

    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(400)
        }
        costOfThePlace.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        nameOfThePlace.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()

        }
        imageOfCubiks.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.top.equalTo(tableView.snp.bottom).offset(90)
            make.centerX.equalToSuperview().offset(-50)
        }
        
        imageOfCubiks2.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.top.equalTo(imageOfCubiks.snp.top)
            make.leading.equalTo(imageOfCubiks.snp.trailing).offset(20)
        }
        
        buttonForRollingTheDice.snp.makeConstraints { make in
            make.width.equalTo(130)
            make.height.equalTo(40)
            make.top.equalTo(imageOfCubiks.snp.bottom).offset(30)
            make.leading.equalTo(imageOfCubiks.snp.leading).inset(15)
        }

        buttonForBuy.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.leading.equalTo(buttonForRollingTheDice.snp.leading).inset(-80)
            make.top.equalTo(buttonForRollingTheDice.snp.bottom).offset(40)
        }
        buttonForSkip.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.leading.equalTo(buttonForBuy.snp.trailing).offset(80)
            make.top.equalTo(buttonForBuy.snp.top)
        }
            
        whichTurn.snp.makeConstraints { make in
            make.top.equalTo(buttonForBuy.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        minusMoney.snp.makeConstraints { make in
            make.top.equalTo(buttonForBuy.snp.bottom).offset(30)
            make.centerX.equalToSuperview()

        }
        

    }
}
