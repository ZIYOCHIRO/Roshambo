//
//  ResultViewController.swift
//  Roshambo
//
//  Created by 10.12 on 2018/7/24.
//  Copyright © 2018 10.12. All rights reserved.
//

import UIKit
import Foundation
class ResultViewController: UIViewController {
    
    // MARK: Properties
    
    
    var match: RockPaperScissorsMatch!
    
    
    var oneMatch = ["result": String(), "detail":String()]
    var mainviewController: ViewController?
    
    // MARK: Outlets
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.resultLabel.text = messageForMatch(match)
        self.resultImage.image = imageForMatch(match)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: messageForMatch()
    func messageForMatch(_ match: RockPaperScissorsMatch) ->String {
        
        // Handle the tie
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        // Here we buile up the results message "RockCrushesScissors. You Win!" etc.
        return match.winner.description + " " + victoryMode(match.winner) + match.loser.description + ". " + resultString(match)
    }
    
    func victoryMode(_ gesture: RockPaperScissors) ->String {
        switch (gesture) {
        case .rock: return "crushes"
        case .paper: return "covers"
        case .scissors: return "cuts"
        }
    }
    
    func resultString(_ match: RockPaperScissorsMatch) -> String {
        return match.p1.defeats(match.p2) ? "You win!":"You lose!"
    }
    
    func imageForMatch(_ match: RockPaperScissorsMatch) -> UIImage {
        var name = ""
        
        switch (match.winner) {
        case .rock: name = "RockCrushesScissors"
        case .paper: name = "PaperCoversRock"
        case .scissors: name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        
        return UIImage(named: name)!
    }
    
    //MARK: Actions
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
