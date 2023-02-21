//
//  Space.swift
//  Monopoly
//
//  Created by Али  on 21.02.2023.
//

import Foundation

class Space {
    let id: Int
    let name: String
    let location: Int
    let cost: Int
    
    init(id: Int, name: String, location: Int, cost: Int) {
        self.id = id
        self.name = name
        self.location = location
        self.cost = cost
//        self.spaces = []
    }
        
        
        // Add more properties and methods as needed
        func getName(for location: Int, in spaces: [Space]) -> String? {
            for space in spaces {
                if space.location == location {
                    return space.name
                }
            }
            return nil
        }

    static func spaceAt(location: Int) -> Space? {
            return spaces.first(where: { $0.location == location })
        }
    
   public static var spaces: [Space] = [
            Space(id: 1, name: "Go", location: 0, cost: 120),
            Space(id: 2, name: "Mediterranean Avenue", location: 1, cost: 60),
            Space(id: 3, name: "Community Chest", location: 2, cost: 320),
            Space(id: 4, name: "Baltic Avenue", location: 3, cost: 60),
            Space(id: 5, name: "Income Tax", location: 4, cost: 50),
            Space(id: 6, name: "Reading Railroad", location: 5, cost: 200),
            Space(id: 7, name: "Oriental Avenue", location: 6, cost: 100),
            Space(id: 8, name: "Chance", location: 7, cost: 210),
            Space(id: 9, name: "Vermont Avenue", location: 8, cost: 100),
            Space(id: 10, name: "Connecticut Avenue", location: 9, cost: 120),
            Space(id: 11, name: "Jail", location: 10, cost: 30),
            Space(id: 12, name: "St. Charles Place", location: 11, cost: 140),
            Space(id: 13, name: "Electric Company", location: 12, cost: 150),
            Space(id: 14, name: "States Avenue", location: 13, cost: 140),
            Space(id: 15, name: "Virginia Avenue", location: 14, cost: 160),
            Space(id: 16, name: "Pennsylvania Railroad", location: 15, cost: 200),
            Space(id: 17, name: "St. James Place", location: 16, cost: 180),
            Space(id: 18, name: "Community Chest", location: 17, cost: 120),
            Space(id: 19, name: "Tennessee Avenue", location: 18, cost: 180),
            Space(id: 20, name: "New York Avenue", location: 19, cost: 200),
            Space(id: 21, name: "Free Parking", location: 20, cost: 20),
            Space(id: 22, name: "Kentucky Avenue", location: 21, cost: 220),
            Space(id: 23, name: "Chance", location: 22, cost: 40),
            Space(id: 24, name: "Indiana Avenue", location: 23, cost: 220),
            Space(id: 25, name: "Illinois Avenue", location: 24, cost: 240),
            Space(id: 26, name: "B. & O. Railroad", location: 25, cost: 200),
            Space(id: 27, name: "Atlantic Avenue", location: 26, cost: 260),
            Space(id: 28, name: "Ventnor Avenue", location: 27, cost: 260),
            Space(id: 29, name: "Water Works", location: 28, cost: 150),
            Space(id: 30, name: "Marvin Gardens", location: 29, cost: 280),
            Space(id: 31, name: "Go To Jail", location: 30, cost: 80),
            Space(id: 32, name: "Pacific Avenue", location: 31, cost: 120),
            Space(id: 33, name: "Al farabi", location: 32, cost: 620),
            Space(id: 34, name: "Sairan", location: 33, cost: 290),
            Space(id: 35, name: "Dostyk", location: 34, cost: 300),
            Space(id: 36, name: "Kaskelen", location: 35, cost: 90),
            Space(id: 37, name: "Alatau", location: 36, cost: 290),
            Space(id: 38, name: "Medeu", location: 37, cost: 290),
            Space(id: 39, name: "Koktobe", location: 38, cost: 290),
            Space(id: 40, name: "Prison", location: 39, cost: -100),
            Space(id: 41, name: "Akkent", location: 40, cost: 180)
            
    ]
    
}

