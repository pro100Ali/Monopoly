//
//  Game.swift
//  Monopoly
//
//  Created by Али  on 21.02.2023.
//

import Foundation

class GameManager {
    var players: [Player] = []
    var currentPlayerIndex = 0
//    var instance = IntroViewController()
//    var playerCount = IntroViewController.arrayOfNames.count

//    print(randomString)
    init() {
        for i in 1...3 {
            print("Creating player \(i)")
            // Prompt the user for name and playing piece, or use default values
            let name = "Player \(i)"
            let playingPiece = 0 // Prompt user for playing piece, or use default
            
            // Create the player object and add it to the array
            let player = Player(id: i, name: name, playingPiece: playingPiece, startingSpace: 0, balance: 2000)
            players.append(player)
        }
        players.append(Player(id: 1, name: "Player 1", playingPiece: 0, startingSpace: 0, balance: 2000))
        players.append(Player(id: 2, name: "Player 2", playingPiece: 0, startingSpace: 0, balance: 2000))
    }
    
    func getCurrentPlayer() -> Player {
        return players[currentPlayerIndex]
    }
    
    func endTurn() {
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count
    }
}
