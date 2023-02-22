//
//  Player.swift
//  Monopoly
//
//  Created by Али  on 20.02.2023.
//

import Foundation
protocol PlayerDelegate: AnyObject {
    func playerDidChangePosition(_ player: Player)
}
class Player {
    let id: Int
    var name: String
    var playingPiece: Int
    var currentPosition: Int
    var balance: Int
    static var space: [Space] = []
     var places: [String] = []
    weak var delegate: PlayerDelegate?
//    var properties: [Space]
//    var manager = GameManager()
    var players: [Int]
    
    init(id: Int, name: String, playingPiece: Int, startingSpace: Int, balance: Int, places: [String]) {
        self.id = id
        self.name = name
        self.playingPiece = playingPiece
        self.currentPosition = startingSpace
        self.balance = balance
        self.places = []
        Player.space = []
//        self.properties = [:]
        players = []
    }
//    func buyTheHouse(cost: Int, position: Int) {
//        balance = balance - cost
//        currentPosition = currentPosition + position
//    }
    
    func changingThePosition(position: Int) {
//        if currentPosition > 40 ? playingPiece+=1 : currentPosition += position
//        currentPosition = (currentPosition + position > 40) ? (currentPosition + position) % 40 : currentPosition + position

//            print(currentPosition)
                
        if let currentSpace = Space.spaceAt(location: currentPosition) {
            print("balance of \(name) is \(balance)")
            print("\(name) landed on \(currentPosition)")
        }
    }
    
    func updatePlayer(step: Int) {
        currentPosition = (currentPosition + step > 40) ? (currentPosition + step) % 40 : currentPosition + step
    }
}
