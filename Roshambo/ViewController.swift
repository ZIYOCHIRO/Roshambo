//
//  ViewController.swift
//  Roshambo
//
//  Created by 10.12 on 2018/7/23.
//  Copyright © 2018 10.12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    var match: RockPaperScissorsMatch!
    var history  =  [RockPaperScissorsMatch]()
    
    // MARk: outlets
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func makeYourMove(_ sender: UIButton) {
        switch (sender) {
        case self.rockButton: throwDown(RockPaperScissors.rock)
        case self.paperButton: throwDown(RockPaperScissors.paper)
        case self.scissorsButton: throwDown(RockPaperScissors.scissors)
        default: assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    // connect ViewController with HistoryController with only code
    @IBAction func showHistory(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "HistoryController") as! HistoryController
        nextViewController.history = self.history
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    func throwDown(_ playersMove: RockPaperScissors) {
        // here the RockPaperScissors generates the opponent move
        let computersMove = RockPaperScissors()
    
        // the RockPaperScissocrMatch stores the result of a match
        self.match = RockPaperScissorsMatch(p1: playersMove, p2: computersMove)
        
        // Add match to the history
        self.history.append(match)
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultViewController
        controller.match = self.match
    }
    
}

