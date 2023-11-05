//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Tim Li on 5/11/2023.
//

import Foundation

struct MemorizeModel {
    
    private(set) var cards: [Card]
    private(set) var theme: Theme
    
    init() {
        let theme = MemorizeModel.emojisByTheme.randomElement()!.key
        let numOfPairs = Array(0..<MemorizeModel.emojisByTheme[theme]!.count).randomElement()!
        let color = ["blue", "green"].randomElement()!
        
        self.theme = Theme(name: theme, numOfPairs: numOfPairs, color: color)
        let emojis = self.theme.getEmojis(number: numOfPairs)
        self.cards = (emojis.map { Card(id: "1\($0)", content: $0) } + emojis.map { Card(id: "2\($0)", content: $0) }).shuffled()
    }
    
    struct Theme {
        var name: String
        var emojis: [String]
        var numOfPairs: Int
        var color: String
        
        init(name: String, numOfPairs: Int, color: String) {
            self.name = name
            self.emojis = emojisByTheme[name] ?? []
            self.numOfPairs = numOfPairs
            self.color = color
        }
        
        func getEmojis(number: Int) -> [String] {
            // FIXME: return random number of emojis
            return emojis
        }
    }
    
    struct Card: Identifiable {
        var id: String
        var content: String
        var isFaceUp = false
        var isMatched = false
    }
    
    static let emojisByTheme = [
        "Sport": [
            "figure.archery",
            "figure.basketball",
            "figure.skiing.downhill",
            "figure.soccer",
            "figure.tennis",
            "figure.outdoor.cycle",
            "figure.open.water.swim"
        ],
        "Transport": [
            "bus",
            "tram",
            "airplane",
            "car",
            "ferry",
            "scooter"
        ],
        "Weather": [
            "sun.rain.fill",
            "sun.snow",
            "cloud",
            "cloud.drizzle",
            "cloud.fog",
            "cloud.sun.fill"
        ]
    ]
}
