
import Foundation

protocol PlayerDelegate2: AnyObject {
    func playerDidChangePosition(_ player: Player)
}

class Player2 {
    let id: Int
    var name: String
    var playingPiece: Int
    var currentPosition: Int
    var balance: Int
    var space: [Space]
//    weak var delegate: PlayerDelegate?
    var properties: [Int: Property]

    var playerLocations: [(Int, Int)] = [(1, 0), (2, 0), (3, 0), (4, 0)]

    init(id: Int, name: String, playingPiece: Int, startingSpace: Int, balance: Int) {
        self.id = id
        self.name = name
        self.playingPiece = playingPiece
        self.currentPosition = startingSpace
        self.balance = balance
        self.space = []
        self.properties = [:]
    }

    func changingThePosition(position: Int) {
        let playerLocation = playerLocations[id - 1]
        let newCount = playerLocation.1 + 1
        
        currentPosition = (currentPosition + position > 40) ? (currentPosition + position) % 40 : currentPosition + position
        print(currentPosition)
        
        if let currentSpace = Space.spaceAt(location: currentPosition) {
            print("\(name) landed on \(currentSpace.name)")
        }
        
        if newCount > 40 {
            playerLocations[id - 1] = (playerLocation.0, 0)
        } else {
            playerLocations[id - 1] = (playerLocation.0, newCount)
        }
    }

    func updatePlayer(step: Int) {
        currentPosition = step
    }
}
