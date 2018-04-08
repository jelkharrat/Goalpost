//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/8/18.
//  Copyright © 2018 practice. All rights reserved.


//There is a reuse identifier that we can use in our table cell when we deque

import UIKit

class GoalCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    //when we instantiate we can pass in proper data
    func configureCell(description: String, type: String, goalProgressAmount: Int) {
        self.goalDescriptionLbl.text = description
        self.goalTypeLbl.text = type
        //creates a string instead of Int
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
    }
    
}
