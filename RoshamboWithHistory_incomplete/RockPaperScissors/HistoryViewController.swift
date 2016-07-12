//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Andrew Marmion on 11/5/15.
//  Copyright © 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    
    //Outlets
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var loses: UILabel!
    @IBOutlet weak var ties: UILabel!
    
    //Variables
    var winText:Int = 0
    var lossText:Int = 0
    var tieText:Int = 0
    var history: [RPSMatch]!
    
    //Override
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateScore()
    }

    //tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let match = history[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell") as UITableViewCell!
        cell.textLabel?.text = result(match)
        cell.detailTextLabel?.text = "\(match.p1) vs \(match.p2)"
        return cell
    }
    
    //updateScore
    func updateScore(){
        wins.text = String(winText)
        loses.text = String(lossText)
        ties.text = String(tieText)
    }
    
    //setting up the cell
    func result(match: RPSMatch) -> String {
        if match.p1 == match.p2{
            tieText++
            return "Tie."
        }else{
            if match.p1.defeats(match.p2) {
                winText++
                return "Win"
            } else {
                lossText++
                return "Loss"
            }
        }
    }
    

    
}
