//
//  RockPaperScissor.swift
//  Roshambo
//
//  Created by 10.12 on 2018/8/19.
//  Copyright © 2018 10.12. All rights reserved.
//

import Foundation

enum RockPaperScissors {
    case rock, paper, scissors
    
    // The init method randomly generates the opponent's move
    init() {
        switch arc4random() % 3 {
        case 0: self = .rock
        case 1: self = .paper
        default: self = .scissors
        }
    }
    
    // The defeates method defines the hiearchy of moves, Rock defeats scissors etc.
    func defeats(_ opponent: RockPaperScissors) -> Bool {
        switch (self, opponent) {
        case (.paper, .rock), (.scissors, .paper), (.rock, .scissors): return true
        default: return false
        }
    }
    
}

extension RockPaperScissors: CustomStringConvertible {
    var description: String {
        get {
            switch (self) {
            case .rock: return "Rock"
            case .paper: return "Paper"
            case .scissors: return "Scissors"
            }
        }
    }
}
