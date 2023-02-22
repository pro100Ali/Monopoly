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
    

    init() {
        for i in 1...2 {
            // Prompt the user for name and playing piece, or use default values
            let name = "Player \(i)"
            let playingPiece = 0 // Prompt user for playing piece, or use default

            // Create the player object and add it to the array
            let player = Player(id: i, name: name, playingPiece: playingPiece, startingSpace: 0, balance: 2000, places: [])
            players.append(player)

        }
//            let player = Player(id: 1, name: "Ali", playingPiece: 0, startingSpace: 0, balance: 2000)
//            players.append(player)



    }
    
    func getCurrentPlayer() -> Player {
        return players[currentPlayerIndex]
    }
    
    func endTurn() {
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count
    }
}
