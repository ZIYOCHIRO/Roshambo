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
    var history: [ [String:String] ]!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailResults")!
        let modelObjectDictionary = self.history![(indexPath as NSIndexPath).row]
        cell.textLabel?.text = modelObjectDictionary["result"]
        cell.detailTextLabel?.text = modelObjectDictionary["detail"]
        
        return cell
    }
        
    
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    
    }
    
    
    
    
    
    
}


