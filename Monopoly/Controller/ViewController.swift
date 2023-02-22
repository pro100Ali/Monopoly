//
//  ViewController.swift
//  Monopoly
//
//  Created by Али  on 20.02.2023.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    var count = 20
    var space: Space = Space(id: 1, name: "bir zher", location: 9, cost: 122)
//    var gameManager.getCurrentPlayer() = Player(id: 1, name: "Ali", playingPiece: 0, startingSpace: 0, balance: 2000)
 
    var id2 = 0
    let images = [
        UIImage(named: "dice1"),
        UIImage(named: "dice2"),
        UIImage(named: "dice3"),
        UIImage(named: "dice4"),
        UIImage(named: "dice5"),
        UIImage(named: "dice6")
    ]

    let gameManager = GameManager()

    // Get the first player

    // Move the player to a new space
    let newPosition = 5
//    player.changingThePosition(position: newPosition)

    // End the turn and get the next player
//    gameManager.endTurn()
    
    @objc func buyHouse() {
        if gameManager.getCurrentPlayer().balance >= Space.spaces[id2].cost {
            gameManager.getCurrentPlayer().balance -= Space.spaces[id2].cost
            print(gameManager.getCurrentPlayer().balance)
            balanceOfThePlayer.text = String(gameManager.getCurrentPlayer().balance)
                        print("\(gameManager.getCurrentPlayer().name) bought a house on \(space.name)")
        } else {
            let alertController = UIAlertController(title: "Wroooong", message: "Akshan zhook", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alertController.addAction(okAction)
            present(alertController, animated: true)
            print("\(gameManager.getCurrentPlayer().name) does not have enough money to buy a house on \(space.name)")
        }
    }
    
    @objc func rollDice() {
        let diceRoll1 = Int.random(in: 1...6)
        let diceRoll2 = Int.random(in: 1...6)
        let totalRoll = diceRoll1 + diceRoll2
//        print("\(totalRoll) the totalRoll")
//        gameManager.getCurrentPlayer().updatePlayer(step: totalRoll)
        if let space = Space.spaces.first(where: { $0.location == totalRoll }) {
//            gameManager.getCurrentPlayer().changingThePosition(position: Space.spaces[id2].location)
            imageOfCubiks.image = images[diceRoll1-1]
            imageOfCubiks2.image = images[diceRoll2-1]
            count += totalRoll
            
            nameOfThePlace.text = Space.spaces[gameManager.getCurrentPlayer().currentPosition].name
             costOfThePlace.text = "\(String(space.cost))$"
             id2 = space.location
            gameManager.endTurn()

//             print(id2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextPlayer = gameManager.getCurrentPlayer()

        view.addSubview(buttonForBuy)
        view.addSubview(buttonForSkip)
        view.addSubview(buttonForRollingTheDice)
        view.addSubview(imageMap)
        view.addSubview(imageOfCubiks)
        view.addSubview(imageOfCubiks2)
        view.addSubview(nameOfThePlace)
        view.addSubview(costOfThePlace)
        view.addSubview(balanceOfThePlayer)
        view.backgroundColor = .white
        setupConstraints()
        title = "Monopoly"
    }
   
    lazy private var imageMap: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mapMonopoly.png")
        image.contentMode = .scaleAspectFill
        
        return image
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
    
    var balanceOfThePlayer: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "2000$"
        return label
    }()
    
    
    func setupConstraints() {
        imageMap.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(130)
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.9)
            make.height.equalTo(imageMap.snp.width).multipliedBy(0.9)

        }
        
        imageOfCubiks.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.top.equalTo(imageMap.snp.bottom).offset(40)
            make.centerX.equalToSuperview().offset(-50)
            
        }
        imageOfCubiks2.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.top.equalTo(imageOfCubiks.snp.top)
            make.leading.equalTo(imageOfCubiks.snp.trailing).offset(20)
        }

        buttonForRollingTheDice.snp.makeConstraints { make in
            make.width.equalTo(130)
            make.top.equalTo(imageOfCubiks.snp.bottom).offset(30)
            make.leading.equalTo(imageOfCubiks.snp.leading).inset(15)
        }
        nameOfThePlace.snp.makeConstraints { make in
            make.top.equalTo(buttonForRollingTheDice.snp.bottom).offset(30)

        }
        costOfThePlace.snp.makeConstraints { make in
            make.top.equalTo(buttonForRollingTheDice.snp.bottom).offset(30)
            make.leading.equalTo(buttonForRollingTheDice.snp.trailing).inset(80)
            
        }
        
        buttonForBuy.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.leading.equalTo(buttonForRollingTheDice.snp.trailing).inset(20)
            make.top.equalTo(costOfThePlace.snp.top)
        }
        buttonForSkip.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.leading.equalTo(buttonForBuy.snp.trailing).offset(10)
            make.top.equalTo(costOfThePlace.snp.top)
        }
        balanceOfThePlayer.snp.makeConstraints { make in
            make.top.equalTo(buttonForBuy.snp.bottom).offset(30)
            make.leading.equalTo(buttonForBuy.snp.leading)
            
        }
    }
}

