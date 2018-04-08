//
//  ViewController.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/5/18.
//  Copyright © 2018 practice. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addGoalButtonWasPressed(_ sender: Any) {
        print("Button was pressed")
    }
}

