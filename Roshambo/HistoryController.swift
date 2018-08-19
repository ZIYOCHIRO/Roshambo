//
//  HistoryController.swift
//  Roshambo
//
//  Created by 10.12 on 2018/7/30.
//  Copyright © 2018 10.12. All rights reserved.
//

import Foundation
import UIKit

class HistoryController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    var history: [RockPaperScissorsMatch]!
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailResults")!
        let match = self.history![(indexPath as NSIndexPath).row]
        cell.textLabel?.text = victoryStatusDescription(match)
        cell.detailTextLabel?.text = "\(match.p1) vs. \(match.p2)"
        
        return cell
    }
    
    func victoryStatusDescription(_ match: RockPaperScissorsMatch) -> String {
        if (match.p1 == match.p2) {
            return "Tie."
        } else if (match.p1.defeats(match.p2)) {
            return "Win!"
        } else {
            return "Loss."
        }
    }
        
    
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    
    }
    
    
}


