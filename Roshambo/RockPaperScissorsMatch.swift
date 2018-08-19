//
//  RPSMatch.swift
//  Roshambo
//
//  Created by 10.12 on 2018/8/19.
//  Copyright © 2018 10.12. All rights reserved.
//

import Foundation

// The RockPaperScissorsMatch struct stores the results of a match.

struct RockPaperScissorsMatch {
    // MARK: Propertes
    let p1: RockPaperScissors
    let p2: RockPaperScissors
    
    // MARK: Initializer
    init(p1: RockPaperScissors, p2: RockPaperScissors) {
        self.p1 = p1
        self.p2 = p2
    }
    
    // MARK: computed prperties
    
    var winner: RockPaperScissors{
        get {
            return p1.defeats(p2) ? p1:p2
        }
    }
    
    var loser: RockPaperScissors {
        get {
            return p1.defeats(p2) ? p2:p1
        }
    }
}
