//
//  Player.swift
//  Monopoly
//
//  Created by Али  on 20.02.2023.
//

import Foundation

class Player {
    let id: Int
    var name: String
    var playingPiece: Int
    var currentPosition: Int
    var balance: Int
    var space: [Space]
    
    
    init(id: Int, name: String, playingPiece: Int, startingSpace: Int, balance: Int) {
        self.id = id
        self.name = name
        self.playingPiece = playingPiece
        self.currentPosition = startingSpace
        self.balance = balance
        self.space = []
    }
    func buyTheHouse(cost: Int, position: Int) {
        balance = balance - cost
        currentPosition = currentPosition + position
    }
    
    func changingThePosition(position: Int) {
//        if currentPosition > 40 ? playingPiece+=1 : currentPosition += position
            
            currentPosition = (currentPosition + position > 40) ? (currentPosition + position) % 40 : currentPosition + position 
//            print(currentPosition)
        
        if let currentSpace = Space.spaceAt(location: currentPosition) {
               print("\(name) landed on \(currentSpace.name)")
//               print(currentPosition)
               // Do something with currentSpace object...
           }
    }
    
    func updatePlayer(step: Int) {
        currentPosition = step
        
    }
    // Add more properties and methods as needed
}
